import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docderm/services/add_messages.dart';
import 'package:docderm/utils/const.dart';
import 'package:docderm/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;

class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  final searchController = TextEditingController();
  String nameSearched = '';

  final msg = TextEditingController();
  String id = '';
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95, // Responsive width
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.7, // Responsive height
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Search bar and Chats list section
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Chats',
                            fontSize: 18,
                            fontFamily: 'Bold',
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width *
                                  0.6, // Responsive search bar width
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Center(
                                  child: TextFormField(
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Regular',
                                        fontSize: 14),
                                    onChanged: (value) {
                                      setState(() {
                                        nameSearched = value;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintText: 'Search',
                                        hintStyle: TextStyle(
                                            fontFamily: 'Regular',
                                            fontSize: 16),
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: Colors.grey,
                                        )),
                                    controller: searchController,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // User search results
                          Expanded(
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Users')
                                  .where('id', isNotEqualTo: userId)
                                  .where('name',
                                      isGreaterThanOrEqualTo:
                                          toBeginningOfSentenceCase(
                                              nameSearched))
                                  .where('name',
                                      isLessThan:
                                          '${toBeginningOfSentenceCase(nameSearched)}z')
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
                                      ),
                                    ),
                                  );
                                }

                                final data = snapshot.requireData;
                                return ListView.builder(
                                  itemCount: data.docs.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          id = data.docs[index].id;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/image 344.png',
                                              height: 50,
                                            ),
                                            const SizedBox(width: 10),
                                            TextWidget(
                                              text: data.docs[index]['name'],
                                              fontSize: 18,
                                              fontFamily: 'Bold',
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Divider for layout separation
                    const VerticalDivider(),
                    // Chat messages section
                    id == ''
                        ? const SizedBox()
                        : Expanded(
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Chats')
                                  .where('ids', arrayContains: userId)
                                  .orderBy('dateTime', descending: true)
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot1) {
                                if (snapshot1.hasError) {
                                  print(snapshot1.error);
                                  return const Text('Error');
                                }
                                if (snapshot1.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                }

                                final docsUserId = snapshot1.data?.docs ?? [];
                                final filteredDocs = docsUserId.where((doc) {
                                  return (doc.data()
                                          as Map<String, dynamic>)['ids']
                                      .contains(id);
                                }).toList();

                                return Column(
                                  children: [
                                    // Message list
                                    Expanded(
                                      child: ListView.builder(
                                        padding: const EdgeInsets.all(10),
                                        itemCount: filteredDocs.length,
                                        itemBuilder: (context, index) {
                                          bool isSender = filteredDocs[index]
                                                  ['sender'] ==
                                              userId;
                                          return Align(
                                            alignment: isSender
                                                ? Alignment.centerRight
                                                : Alignment.centerLeft,
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              padding: const EdgeInsets.all(12),
                                              constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.6),
                                              decoration: BoxDecoration(
                                                color: isSender
                                                    ? Colors.blue[100]
                                                    : Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      const Radius.circular(12),
                                                  topRight:
                                                      const Radius.circular(12),
                                                  bottomLeft: isSender
                                                      ? const Radius.circular(
                                                          12)
                                                      : Radius.zero,
                                                  bottomRight: isSender
                                                      ? Radius.zero
                                                      : const Radius.circular(
                                                          12),
                                                ),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 4,
                                                    offset: Offset(0, 2),
                                                  ),
                                                ],
                                              ),
                                              child: TextWidget(
                                                text: filteredDocs[index]
                                                    ['msg'],
                                                fontSize: 16,
                                                fontFamily: 'Regular',
                                                color: Colors.black87,
                                                isBold: false,
                                                maxLines: 3,
                                                align: TextAlign.start,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    // Message input area
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller: msg,
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Type your message...',
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 15),
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          FloatingActionButton(
                                            onPressed: () async {
                                              DocumentSnapshot
                                                  documentSnapshot =
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('Users')
                                                      .doc(userId)
                                                      .get();
                                              addMessages(id, msg.text,
                                                  documentSnapshot['name']);
                                              msg.clear();
                                            },
                                            backgroundColor: Colors.blueAccent,
                                            child: const Icon(
                                              Icons.send,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
