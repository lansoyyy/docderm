import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docderm/screens/landing_screen.dart';
import 'package:docderm/screens/tabs/chat_tab.dart';
import 'package:docderm/screens/tabs/community_tab.dart';
import 'package:docderm/screens/tabs/create_tab.dart';
import 'package:docderm/screens/tabs/home_tab.dart';
import 'package:docderm/services/create_community.dart';
import 'package:docderm/utils/colors.dart';
import 'package:docderm/utils/const.dart';
import 'package:docderm/widgets/button_widget.dart';
import 'package:docderm/widgets/logout_widget.dart';
import 'package:docderm/widgets/text_widget.dart';
import 'package:docderm/widgets/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:tflite_web/tflite_web.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getmyData();
  }

  String myname = '';
  String mytype = '';
  String email = '';

  getmyData() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      myname = documentSnapshot['name'];
      mytype = documentSnapshot['type'];
      email = documentSnapshot['email'];
    });
  }

  final searchController = TextEditingController();
  String nameSearched = '';

  List items = [
    {'icon': Icons.home, 'name': 'Home'},
    {'icon': Icons.create, 'name': 'Create'},
    {'icon': Icons.chat_bubble_outline_outlined, 'name': 'Chat'},
    {'icon': Icons.notifications, 'name': 'Notifications'},
    // {'icon': Icons.history, 'name': 'Recent'},
    {'icon': Icons.groups_2_outlined, 'name': 'Community'},
  ];

  int index = 0;

  List tabs = [
    const HomeTab(),
    const CreateTab(),
    const ChatTab(),
    const SizedBox(),
    // const SizedBox(),
    const CommunityTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: index == 4
          ? FloatingActionButton(
              backgroundColor: primary,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: createCommunity(),
                    );
                  },
                );
              },
            )
          : null,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            color: secondary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/Group 358.png',
                    height: 25,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 20),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Regular',
                              fontSize: 14,
                            ),
                            onChanged: (value) {
                              setState(() {
                                nameSearched = value;
                              });
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: Colors.black),
                              hintText: 'Search DocDerm',
                              hintStyle: TextStyle(
                                fontFamily: 'Regular',
                                fontSize: 16,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                            controller: searchController,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      logout(context, const LandingScreen());
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: constraints.maxWidth *
                          0.2, // Adjust width proportionally
                      height: 500,
                      decoration: BoxDecoration(
                        color: secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          for (int i = 0; i < items.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: GestureDetector(
                                onTap: () {
                                  if (i == 3) {
                                    showNotifs();
                                  } else {
                                    setState(() {
                                      index = i;
                                    });
                                  }
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      items[i]['icon'],
                                      size: 25,
                                      color: index == i
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    TextWidget(
                                      text: items[i]['name'],
                                      fontSize: 12,
                                      fontFamily:
                                          index == i ? 'Bold' : 'Medium',
                                      color: index == i
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          const Expanded(child: SizedBox(height: 20)),
                          PopupMenuButton(
                            icon: Image.asset(
                              'assets/images/image 344.png',
                              height: 50,
                            ),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/image 344.png',
                                        height: 50,
                                      ),
                                      const SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: myname,
                                            fontSize: 16,
                                            fontFamily: 'Bold',
                                          ),
                                          const SizedBox(height: 3),
                                          TextWidget(
                                            text: email,
                                            fontSize: 12,
                                            fontFamily: 'Regular',
                                            color: Colors.grey,
                                            isItalize: true,
                                          ),
                                          const SizedBox(height: 3),
                                          TextWidget(
                                            text: mytype,
                                            fontSize: 12,
                                            fontFamily: 'Regular',
                                            color: Colors.grey,
                                            isItalize: true,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ];
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: tabs[index],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  showNotifs() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Notifs')
                      .where('otherUserId',
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return const Center(child: Text('Error'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Center(
                            child: CircularProgressIndicator(
                          color: Colors.black,
                        )),
                      );
                    }

                    final data = snapshot.requireData;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Notifications',
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          for (int i = 0; i < data.docs.length; i++)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.notifications,
                                    size: 50,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  TextWidget(
                                    text: data.docs[i]['msg'],
                                    fontSize: 16,
                                    fontFamily: 'Bold',
                                    maxLines: 3,
                                  ),
                                  const Expanded(
                                    child: SizedBox(
                                      width: 10,
                                    ),
                                  ),
                                  TextWidget(
                                    text: DateFormat.yMMMd().add_jm().format(
                                        data.docs[i]['dateTime'].toDate()),
                                    fontSize: 14,
                                    fontFamily: 'Medium',
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        );
      },
    );
  }

  final name = TextEditingController();

  Widget createCommunity() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: SizedBox(
        height: 350,
        width: 350,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                text: 'Create Community',
                fontSize: 32,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 50,
              ),
              TextFieldWidget(
                label: 'Community Name  ',
                controller: name,
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonWidget(
                width: 300,
                label: 'Create',
                onPressed: () async {
                  Navigator.pop(context);
                  final id = await addCommunity(name.text);

                  await FirebaseFirestore.instance
                      .collection('Users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    'community': FieldValue.arrayUnion([id]),
                  });
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
}
