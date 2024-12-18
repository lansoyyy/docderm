import 'package:docderm/screens/admin/admin_home.dart';
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

  bool isDermatologist = false;
  @override
  Widget build(BuildContext context) {
    // Define breakpoints for mobile
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600; // Mobile breakpoint

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20), // Adjusted padding for mobile
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/Group 358.png',
                      height: isMobile ? 20 : 25, // Smaller height for mobile
                    ),
                    const SizedBox(),
                    Row(
                      children: [
                        ButtonWidget(
                          height:
                              isMobile ? 35 : 40, // Smaller button for mobile
                          width: isMobile ? 80 : 100,
                          fontSize: isMobile ? 12 : 14,
                          label: 'Login',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(child: login());
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ButtonWidget(
                          height:
                              isMobile ? 35 : 40, // Smaller button for mobile
                          width: isMobile ? 80 : 100,
                          fontSize: isMobile ? 12 : 14,
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
                        const SizedBox(
                          width: 20,
                        ),
                        ButtonWidget(
                          height:
                              isMobile ? 35 : 40, // Smaller button for mobile
                          width: isMobile ? 80 : 100,
                          fontSize: isMobile ? 12 : 14,
                          label: 'Continue as Admin',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(child: admin());
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30), // Adjusted spacing
                Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Welcome to ',
                      fontSize: isMobile ? 35 : 45, // Smaller font for mobile
                      fontFamily: 'Regular',
                    ),
                    TextWidget(
                      text: 'Your Skin’s Sanctuary ',
                      fontSize: isMobile ? 35 : 45,
                      fontFamily: 'Bold',
                      color: primary,
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: isMobile
                          ? double.infinity
                          : 450, // Full width for mobile
                      child: TextWidget(
                        maxLines: 5,
                        text:
                            'DocDerm isn’t just a website; it’s a supportive community. Share your journey, connect with others, and find solace in knowing that you’re part of something bigger.',
                        fontSize: isMobile ? 12 : 14, // Smaller font for mobile
                        fontFamily: 'Regular',
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: isMobile
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        ButtonWidget(
                          height: isMobile ? 35 : 40,
                          width: isMobile ? 80 : 100,
                          fontSize: isMobile ? 12 : 14,
                          label: 'Read More',
                          onPressed: () {},
                        ),
                        const SizedBox(width: 20),
                        Container(
                          height: isMobile ? 30 : 33,
                          width: isMobile ? 80 : 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: TextWidget(
                              text: "Let’s Start",
                              fontSize: isMobile ? 12 : 14,
                              fontFamily: 'Regular',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                if (!isMobile)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/image 285.png',
                        width: 600,
                      ),
                    ],
                  )
                else
                  Image.asset(
                    'assets/images/image 285.png',
                    width: 300, // Smaller image for mobile
                  ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 400,
                      child: Divider(color: Colors.grey),
                    ),
                    const SizedBox(width: 15),
                    TextWidget(
                      text: 'DocDerm Offers',
                      fontSize: isMobile ? 30 : 38,
                      fontFamily: 'Bold',
                      color: primary,
                    ),
                    const SizedBox(width: 15),
                    const SizedBox(
                      width: 400,
                      child: Divider(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 15, // Use Wrap for responsiveness in mobile view
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    for (int i = 0; i < items.length; i++)
                      Container(
                        width: isMobile ? 250 : 330, // Smaller width for mobile
                        height: 430,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: primary),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/${items[i]['img']}.png',
                                width:
                                    isMobile ? 220 : 280, // Adjusted image size
                              ),
                              const SizedBox(height: 20),
                              TextWidget(
                                text: items[i]['title'],
                                fontSize: isMobile ? 20 : 24,
                                fontFamily: 'Bold',
                                color: primary,
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: isMobile
                                    ? double.infinity
                                    : 450, // Adjusted for mobile
                                child: TextWidget(
                                  maxLines: 5,
                                  text: items[i]['desc'],
                                  fontSize: isMobile ? 10 : 12,
                                  fontFamily: 'Regular',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 50),
                const Divider(color: Colors.grey),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/image 315.png',
                      width: isMobile
                          ? 300
                          : 600, // Adjusted image width for mobile
                    ),
                    if (!isMobile)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'About DocDerm  ',
                            fontSize: 32,
                            fontFamily: 'Bold',
                            color: primary,
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 425,
                            child: TextWidget(
                              maxLines: 20,
                              text:
                                  'We are a dedicated team of students from CSTC Sariaya, driven by compassion and innovation. Our mission is to create a responsive web-based community platform that empowers individuals with skin conditions.',
                              fontSize: 14,
                              fontFamily: 'Regular',
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 50),
                Container(
                  height: 400,
                  width: double.infinity,
                  color: primary,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
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
                                  fontSize: isMobile ? 20 : 24,
                                  fontFamily: 'Bold',
                                  color: Colors.white,
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: isMobile ? 200 : 300,
                                  child: TextWidget(
                                    maxLines: 5,
                                    text:
                                        'Stay updated on DocDerm’s latest news by following our social media accounts!',
                                    fontSize: isMobile ? 12 : 14,
                                    fontFamily: 'Regular',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            // Add additional columns here similarly if needed
                          ],
                        ),
                        const SizedBox(height: 50),
                        const Divider(color: Colors.white),
                        const SizedBox(height: 50),
                        Center(
                          child: TextWidget(
                            text:
                                'Copyright ©DocDerm. All Rights Reserved. Designed by JTech Inc.',
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

  webview() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/Group 358.png',
                    height: 25,
                  ),
                  const Expanded(child: SizedBox()),
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
                  const SizedBox(
                    width: 20,
                  ),
                  ButtonWidget(
                    height: 40,
                    width: 100,
                    fontSize: 14,
                    label: 'Login',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(child: login());
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
                                      padding: const EdgeInsets.only(left: 10),
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
    );
  }

  Widget register() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: StatefulBuilder(builder: (context, setState) {
        return SizedBox(
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
                  label: 'Email  ',
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
                SwitchListTile(
                  title: TextWidget(
                    text: isDermatologist ? "Dermatologist" : "Patient",
                    fontSize: 14,
                  ),
                  subtitle: TextWidget(
                    text: "Switch to select user type",
                    fontSize: 14,
                  ),
                  value: isDermatologist,
                  onChanged: (bool value) {
                    setState(() {
                      isDermatologist = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  width: 300,
                  label: 'Register',
                  onPressed: () {
                    registerUser(context);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget login() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: StatefulBuilder(builder: (context, setState) {
        return SizedBox(
          height: 380,
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
                  text: 'Login',
                  fontSize: 32,
                  fontFamily: 'Bold',
                ),
                TextFieldWidget(
                  label: 'Email  ',
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
                const SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  width: 300,
                  label: 'Login',
                  onPressed: () {
                    loginUser();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  final email = TextEditingController();
  final adminpassword = TextEditingController();
  Widget admin() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: StatefulBuilder(builder: (context, setState) {
        return SizedBox(
          height: 400,
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
                  text: 'Admin Account',
                  fontSize: 32,
                  fontFamily: 'Bold',
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  label: 'Email  ',
                  controller: email,
                ),
                TextFieldWidget(
                  isObscure: true,
                  showEye: true,
                  label: 'Password  ',
                  controller: adminpassword,
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  width: 300,
                  label: 'Continue',
                  onPressed: () {
                    Navigator.pop(context);
                    if (email.text == 'admin@docderm.com' &&
                        adminpassword.text == 'docderm') {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const AdminScreen()),
                      );
                    } else {
                      showToast('Invalid admin credentails');
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  registerUser(context) async {
    if (username.text.isEmpty ||
        password.text.isEmpty ||
        name.text.isEmpty ||
        number.text.isEmpty) {
      showToast("Please fill in all the required fields.");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: username.text, password: password.text);

      await addUser(name.text, username.text, number.text,
          isDermatologist ? 'Dermatologist' : 'Patient');

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

  loginUser() async {
    if (username.text.isEmpty || password.text.isEmpty) {
      showToast("Please enter both email and password.");
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: username.text, password: password.text);

      if (context.mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
      showToast("Logged in Successfully!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showToast('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        showToast('The email address is not valid.');
      } else {
        showToast(e.message ?? "An unknown error occurred.");
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
