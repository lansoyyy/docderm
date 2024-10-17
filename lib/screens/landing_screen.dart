import 'package:docderm/screens/home_screen.dart';
import 'package:docderm/services/add_user.dart';
import 'package:docderm/utils/colors.dart';
import 'package:docderm/widgets/button_widget.dart';
import 'package:docderm/widgets/text_widget.dart';
import 'package:docderm/widgets/textfield_widget.dart';
import 'package:docderm/widgets/toast_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List items = [
    {
      'title': 'Peer Support',
      'desc':
          'Connect with others who understand your journey. Share experiences, ask questions, and find encouragement. Whether it’s psoriasis, eczema, acne, or any other skin issue, you’re not alone.',
      'img': 'image 305',
    },
    {
      'title': 'Patient Stories',
      'desc':
          'Read inspiring stories from individuals who’ve overcome skin challenges. Their resilience and positivity will motivate you on your own path.',
      'img': 'image 312',
    },
    {
      'title': 'Educational Resources',
      'desc':
          'Access articles, videos, and expert advice on managing skin conditions. Learn about treatment options, lifestyle tips, and self-care practices.',
      'img': 'image 311',
    },
  ];

  List medias = ['fb', 'twitter', 'tiktok', 'ig'];

  final username = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/Group 358.png',
                      height: 25,
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: TextWidget(
                            text: 'Home',
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: TextWidget(
                            text: 'About Us',
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: TextWidget(
                            text: 'Private Policy',
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    ButtonWidget(
                      height: 40,
                      width: 100,
                      fontSize: 14,
                      label: 'Signup',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(child: register());
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Welcome to ',
                          fontSize: 45,
                          fontFamily: 'Regular',
                        ),
                        TextWidget(
                          text: 'Your Skin’s Sanctuary ',
                          fontSize: 45,
                          fontFamily: 'Bold',
                          color: primary,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: 450,
                          child: TextWidget(
                            maxLines: 5,
                            text:
                                'DocDerm isn’t just a website; it’s a supportive community. Share your journey, connect with others, and find solace in knowing that you’re part of something bigger.',
                            fontSize: 14,
                            fontFamily: 'Regular',
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            ButtonWidget(
                              height: 40,
                              width: 100,
                              fontSize: 14,
                              label: 'Read More',
                              onPressed: () {},
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Container(
                              height: 33,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Center(
                                child: TextWidget(
                                  text: "Let’s Start",
                                  fontSize: 14,
                                  fontFamily: 'Regular',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/image 285.png',
                      width: 600,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 400,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    TextWidget(
                      text: 'DocDerm Offers',
                      fontSize: 38,
                      fontFamily: 'Bold',
                      color: primary,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const SizedBox(
                      width: 400,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < items.length; i++)
                      Container(
                        width: 330,
                        height: 430,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: primary,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/${items[i]['img']}.png',
                                width: 280,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextWidget(
                                text: items[i]['title'],
                                fontSize: 24,
                                fontFamily: 'Bold',
                                color: primary,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 450,
                                child: TextWidget(
                                  maxLines: 5,
                                  text: items[i]['desc'],
                                  fontSize: 12,
                                  fontFamily: 'Regular',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/image 315.png',
                      width: 600,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'About DocDerm  ',
                          fontSize: 32,
                          fontFamily: 'Bold',
                          color: primary,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 425,
                          child: TextWidget(
                            maxLines: 20,
                            text:
                                'We are a dedicated team of students from CSTC Sariaya, driven by compassion and innovation. Our mission is to create a responsive web-based community platform that empowers individuals with skin conditions. By fostering a safe space, we aim to break down stigma, provide expert guidance, and enhance the quality of life for those seeking support. Join us in building a community where everyone’s voice matters! ',
                            fontSize: 14,
                            fontFamily: 'Regular',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 400,
                  width: double.infinity,
                  color: primary,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: 'FOLLOW US',
                                  fontSize: 24,
                                  fontFamily: 'Bold',
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: TextWidget(
                                    maxLines: 5,
                                    text:
                                        'Stay updated on DocDerm’s latest news and developments by following our social media accounts!',
                                    fontSize: 14,
                                    fontFamily: 'Regular',
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    for (int i = 0; i < medias.length; i++)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              'assets/images/${medias[i]}.png',
                                              height: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: 'COMMUNITY',
                                  fontSize: 24,
                                  fontFamily: 'Bold',
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: TextWidget(
                                    maxLines: 5,
                                    text: '''
DocDerm.com
DocDerm for Community
Content Policy
Help Center
Moderator Code of Conduct
''',
                                    fontSize: 14,
                                    fontFamily: 'Regular',
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: 'PRIVACY & SAFETY',
                                  fontSize: 24,
                                  fontFamily: 'Bold',
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: TextWidget(
                                    maxLines: 5,
                                    text: '''
Privacy Policy
User Agreement
Transparency Report
d/docdermsecurity
Other Terms and Policies
''',
                                    fontSize: 14,
                                    fontFamily: 'Regular',
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: TextWidget(
                            text:
                                'Copyright ©DocDerm. All Rights Reserved.Designed by JTech Inc.',
                            fontSize: 24,
                            fontFamily: 'Bold',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget register() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: SizedBox(
        height: 500,
        width: 350,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.account_circle,
                size: 75,
              ),
              TextWidget(
                text: 'Create Account',
                fontSize: 32,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                label: 'Fullname  ',
                controller: name,
              ),
              TextFieldWidget(
                label: 'Contact Number  ',
                controller: number,
              ),
              TextFieldWidget(
                label: 'Username  ',
                controller: username,
              ),
              TextFieldWidget(
                isObscure: true,
                showEye: true,
                label: 'Password  ',
                controller: password,
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonWidget(
                width: 300,
                label: 'Register',
                onPressed: () {
                  Navigator.pop(context);
                  registerUser(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  registerUser(context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: username.text, password: password.text);

      addUser(name.text, username.text, number.text);

      // signup(nameController.text, numberController.text, addressController.text,
      //     emailController.text);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username.text, password: password.text);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
      showToast("Registered Successfully!");

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showToast('The email address is not valid.');
      } else {
        showToast(e.toString());
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
