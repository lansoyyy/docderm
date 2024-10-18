import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docderm/utils/colors.dart';
import 'package:docderm/utils/const.dart';
import 'package:docderm/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CommunityTab extends StatelessWidget {
  const CommunityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Post').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              return SizedBox(
                width: 600,
                height: 600,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < data.docs.length; i++)
                        Card(
                          child: SizedBox(
                            width: 600,
                            height: 250,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/image 344.png',
                                        height: 50,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      TextWidget(
                                        text: data.docs[i]['myname'],
                                        fontSize: 18,
                                        fontFamily: 'Bold',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextWidget(
                                    maxLines: 100,
                                    text: data.docs[i]['desc'],
                                    fontSize: 14,
                                    fontFamily: 'Medium',
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
        const SizedBox(
          width: 20,
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Community')
                      .where('members', arrayContains: userId)
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
                    return Card(
                      child: SizedBox(
                        width: 400,
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: 'My Community',
                                  fontSize: 18,
                                  fontFamily: 'Bold',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                for (int i = 0; i < data.docs.length; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const CircleAvatar(
                                          minRadius: 35,
                                          maxRadius: 35,
                                          child: Icon(
                                            Icons.groups_2_outlined,
                                            color: primary,
                                            size: 50,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              text: data.docs[i]['name'],
                                              fontSize: 24,
                                              fontFamily: 'Bold',
                                            ),
                                            TextWidget(
                                              text:
                                                  '${data.docs[i]['members'].length} members',
                                              fontSize: 14,
                                              fontFamily: 'Medium',
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Community')
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

                    return Card(
                      child: SizedBox(
                        width: 400,
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: 'Groups',
                                  fontSize: 18,
                                  fontFamily: 'Bold',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                for (int i = 0; i < data.docs.length; i++)
                                  Builder(builder: (context) {
                                    List members = data.docs[i]['members'];
                                    return members.contains(userId)
                                        ? const SizedBox()
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const CircleAvatar(
                                                  minRadius: 35,
                                                  maxRadius: 35,
                                                  child: Icon(
                                                    Icons.groups_2_outlined,
                                                    color: primary,
                                                    size: 50,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    TextWidget(
                                                      text: data.docs[i]
                                                          ['name'],
                                                      fontSize: 24,
                                                      fontFamily: 'Bold',
                                                    ),
                                                    TextWidget(
                                                      text:
                                                          '${members.length} members',
                                                      fontSize: 14,
                                                      fontFamily: 'Medium',
                                                      color: Colors.grey,
                                                    ),
                                                  ],
                                                ),
                                                const Expanded(
                                                  child: SizedBox(
                                                    width: 10,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Join Community'),
                                                          content: const Text(
                                                              'Do you want to join this community?'),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(); // Dismiss the dialog
                                                              },
                                                              child: const Text(
                                                                  'Cancel'),
                                                            ),
                                                            ElevatedButton(
                                                              onPressed:
                                                                  () async {
                                                                await FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'Users')
                                                                    .doc(userId)
                                                                    .update({
                                                                  'community':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    data.docs[i]
                                                                        .id
                                                                  ]),
                                                                });
                                                                await FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'Community')
                                                                    .doc(data
                                                                        .docs[i]
                                                                        .id)
                                                                    .update({
                                                                  'members':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    userId
                                                                  ]),
                                                                });
                                                                // Call the function to join the community
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(); // Dismiss the dialog
                                                              },
                                                              child: const Text(
                                                                  'Join'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  icon: const Icon(
                                                    Icons.join_inner_sharp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                  }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
