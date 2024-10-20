import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docderm/services/add_post.dart';
import 'package:docderm/utils/const.dart';
import 'package:docderm/utils/data.dart';
import 'package:docderm/widgets/button_widget.dart';
import 'package:docderm/widgets/text_widget.dart';
import 'package:docderm/widgets/textfield_widget.dart';
import 'package:docderm/widgets/toast_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:html' as html;
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_web/tflite_web.dart';

class CreateTab extends StatefulWidget {
  const CreateTab({super.key});

  @override
  State<CreateTab> createState() => _CreateTabState();
}

class _CreateTabState extends State<CreateTab> {
  final desc = TextEditingController();

  TFLiteModel? model;
  String? imageUrl;
  String? predictionResult;

  @override
  void initState() {
    super.initState();
    loadModel(); // Load the model when the state is initialized
  }

  Future<void> loadModel() async {
    try {
      model = await TFLiteModel.fromUrl(
          'assets/models/model_unquant.tflite'); // Load the model from assets
      print('Model loaded successfully');
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  final List<String> labels = [
    "VASC",
    "SCC",
    "NV",
    "MEL",
    "DF",
    "BKL",
    "BCC",
    "AK"
  ];
  void _uploadImage() {
    // Create a file upload element and listen for changes
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement()
      ..accept = 'image/*';
    uploadInput.click(); // Simulate a click on the upload input element

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;

      if (files != null && files.isNotEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return const Dialog(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          },
        );
        final file = files.first;
        final reader = html.FileReader();
        FirebaseStorage fs = FirebaseStorage.instance;

        reader.onLoadEnd.listen((event) async {
          // Make sure to use async here since you're awaiting inside
          final blobUrl = html.Url.createObjectUrlFromBlob(file);

          var snapshot =
              await fs.ref().child(DateTime.now().toString()).putBlob(file);
          String downloadUrl = await snapshot.ref.getDownloadURL();
          setState(() {
            imageUrl = downloadUrl; // Set the image URL for display
          });
          print('Image uploaded. Starting prediction...');

          await _predictImage(file); // Await the prediction
        });

        reader.readAsDataUrl(file);
      }
    });
  }

  Future<Float32List> imageToTensor(html.File imageFile,
      {int inputSize = 224}) async {
    // Convert the image file to a tensor
    final reader = html.FileReader();
    final completer = Completer<Uint8List>();
    reader.readAsArrayBuffer(imageFile);
    reader.onLoadEnd.listen((event) {
      completer.complete(reader.result as Uint8List);
    });
    final imageBytes = await completer.future;

    // Decode and process the image
    img.Image? image = img.decodeImage(imageBytes);
    if (image == null) {
      throw Exception('Unable to decode the image');
    }
    img.Image resizedImage =
        img.copyResize(image, width: inputSize, height: inputSize);

    // Convert the image to a Float32List to be used as input for the model
    var tensor = Float32List(1 * inputSize * inputSize * 3);
    var bufferIndex = 0;
    for (var y = 0; y < inputSize; y++) {
      for (var x = 0; x < inputSize; x++) {
        var pixel = resizedImage.getPixel(x, y);
        tensor[bufferIndex++] = img.getRed(pixel) / 255.0;
        tensor[bufferIndex++] = img.getGreen(pixel) / 255.0;
        tensor[bufferIndex++] = img.getBlue(pixel) / 255.0;
      }
    }
    return tensor; // Return the tensor
  }

  Future<void> _predictImage(html.File imageFile) async {
    if (model == null) {
      setState(() => predictionResult = "Model not loaded yet.");
      print('Model is not loaded.');
      return;
    }
    try {
      final tensorData = await imageToTensor(imageFile);
      // Here you should call the predict method of the model

      // For example: final outputs = await model.predict(tensorData);
      print('Prediction completed. $tensorData');
      // Set the prediction result in the state
      setState(() {
        predictionResult =
            "Prediction result: ..."; // Replace with actual prediction result
      });
    } catch (e) {
      print('Error in prediction: $e');
      setState(() => predictionResult = "Error in prediction: $e");
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Get the width of the container
          double containerWidth = constraints.maxWidth;

          // Adjust child elements based on available width
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Column
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Create Post',
                      fontSize: 24,
                      fontFamily: 'Bold',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Adjust width of text field dynamically
                    TextFieldWidget(
                      label: 'Type here...',
                      controller: desc,
                      height: 350,
                      width: containerWidth *
                          0.35, // Use percentage of container width
                      maxLine: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        imageUrl != null
                            ? ButtonWidget(
                                height: 40,
                                width: 100,
                                fontSize: 14,
                                label: 'Post',
                                onPressed: () async {
                                  DocumentSnapshot documentSnapshot =
                                      await FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(userId)
                                          .get();
                                  final random = Random();
                                  addPost(
                                      skinDiseases[random.nextInt(9)].name,
                                      desc.text,
                                      imageUrl,
                                      documentSnapshot['name']);
                                  showToast('Succesfully posted!');
                                },
                              )
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                // Right Column: Image section
                imageUrl != null
                    ? Container(
                        height: containerWidth > 800
                            ? 750
                            : 500, // Adjust height for small screens
                        width:
                            containerWidth * 0.45, // Use percentage for width
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[300]!,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(imageUrl!),
                              fit: BoxFit.cover),
                        ),
                      )
                    : Container(
                        height: containerWidth > 800 ? 750 : 500,
                        width: containerWidth * 0.45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[300]!,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: 'Drag and Drop an images or videos',
                              fontSize: 18,
                              fontFamily: 'Regular',
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextWidget(
                              text: 'or',
                              fontSize: 14,
                              fontFamily: 'Regular',
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextButton.icon(
                              icon: const Icon(
                                Icons.upload,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                _uploadImage();
                              },
                              label: TextWidget(
                                text: 'Upload ',
                                fontSize: 14,
                                fontFamily: 'Regular',
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
