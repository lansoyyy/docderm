import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docderm/utils/colors.dart';
import 'package:docderm/utils/const.dart';
import 'package:docderm/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AdminCommunityTab extends StatelessWidget {
  const AdminCommunityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2, // Adjusts the weight of this section
          child: StreamBuilder<QuerySnapshot>(
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
                    ),
                  ),
                );
              }

              final data = snapshot.requireData;
              return SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.45, // Responsive width
                height: MediaQuery.of(context).size.height *
                    0.7, // Responsive height
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < data.docs.length; i++)
                        Card(
                          child: SizedBox(
                            width: double
                                .infinity, // Make card width take full width
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
            },
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 1, // Adjusts the weight of this section
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                          ),
                        ),
                      );
                    }

                    final data = snapshot.requireData;

                    return Card(
                      child: SizedBox(
                        width:
                            double.infinity, // Make card width take full width
                        height: 500,
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
                                    return Padding(
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
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
