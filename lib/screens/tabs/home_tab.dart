import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docderm/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            child: SizedBox(
              width: 1000,
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Stories',
                      fontSize: 18,
                      fontFamily: 'Bold',
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Post')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return const Center(child: Text('Error'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.black,
                              )),
                            );
                          }

                          final data = snapshot.requireData;
                          return Row(
                            children: [
                              for (int i = 0; i < data.docs.length; i++)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: Container(
                                    width: 125,
                                    height: 173,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(data.docs[i]['img']),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            maxLines: 1,
                                            text: data.docs[i]['title'],
                                            fontSize: 14,
                                            fontFamily: 'Bold',
                                            color: Colors.white,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.account_circle_sharp,
                                                color: Colors.white,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              TextWidget(
                                                text: data.docs[i]['myname'],
                                                fontSize: 12,
                                                fontFamily: 'Medium',
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            width: 1000,
            child: Divider(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('Post').snapshots(),
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
                return Column(
                  children: [
                    for (int i = 0; i < data.docs.length; i++)
                      Card(
                        child: SizedBox(
                          width: 1000,
                          height: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.account_circle_sharp,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    TextWidget(
                                      text: data.docs[i]['myname'],
                                      fontSize: 12,
                                      fontFamily: 'Medium',
                                      color: Colors.black,
                                    ),
                                    const Expanded(
                                      child: SizedBox(
                                        width: 10,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.more_vert_sharp,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                  text: data.docs[i]['title'],
                                  fontSize: 18,
                                  fontFamily: 'Bold',
                                  color: Colors.black,
                                ),
                                TextWidget(
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
                );
              }),
        ],
      ),
    );
  }
}
