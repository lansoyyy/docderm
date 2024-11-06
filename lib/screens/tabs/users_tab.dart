import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docderm/widgets/text_widget.dart';
import 'package:docderm/widgets/toast_widget.dart';
import 'package:flutter/material.dart';

class UsersTab extends StatelessWidget {
  const UsersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
          return DataTable(
            columns: [
              DataColumn(
                label: TextWidget(
                  text: 'Name',
                  fontSize: 18,
                  fontFamily: 'Bold',
                ),
              ),
              DataColumn(
                label: TextWidget(
                  text: 'Email',
                  fontSize: 18,
                  fontFamily: 'Bold',
                ),
              ),
              DataColumn(
                label: TextWidget(
                  text: 'Contact Number',
                  fontSize: 18,
                  fontFamily: 'Bold',
                ),
              ),
              DataColumn(
                label: TextWidget(
                  text: '',
                  fontSize: 18,
                  fontFamily: 'Bold',
                ),
              ),
            ],
            rows: [
              for (int i = 0; i < data.docs.length; i++)
                DataRow(cells: [
                  DataCell(
                    TextWidget(
                      text: data.docs[i]['name'],
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  DataCell(
                    TextWidget(
                      text: data.docs[i]['email'],
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  DataCell(
                    TextWidget(
                      text: data.docs[i]['number'],
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  DataCell(
                    IconButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('Users')
                            .doc(data.docs[i].id)
                            .delete();
                        showToast('User deleted!');
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ])
            ],
          );
        });
  }
}
