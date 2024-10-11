import 'package:docderm/widgets/button_widget.dart';
import 'package:docderm/widgets/text_widget.dart';
import 'package:docderm/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class CreateTab extends StatefulWidget {
  const CreateTab({super.key});

  @override
  State<CreateTab> createState() => _CreateTabState();
}

class _CreateTabState extends State<CreateTab> {
  final desc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      height: 550,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                Container(
                  width: 250,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: TextWidget(
                      text: 'Select Community',
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  label: 'Type here...',
                  controller: desc,
                  height: 350,
                  width: 350,
                  maxLine: 30,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ButtonWidget(
                      height: 40,
                      width: 100,
                      fontSize: 14,
                      label: 'Post',
                      onPressed: () {},
                    ),
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
            Container(
              height: 750,
              width: 500,
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
                    onPressed: () {},
                    label: TextWidget(
                      text: 'Upload ',
                      fontSize: 14,
                      fontFamily: 'Regular',
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
