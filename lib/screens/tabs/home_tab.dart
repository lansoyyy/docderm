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
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: Container(
                              width: 125,
                              height: 173,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: 'Title',
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
                                          text: 'Name here',
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
                    ),
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
                          text: 'Name here',
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
                      text: 'Title here',
                      fontSize: 18,
                      fontFamily: 'Bold',
                      color: Colors.black,
                    ),
                    TextWidget(
                      text:
                          'Eiusmod nisi consectetur aliqua veniam amet est culpa minim dolor labore sint anim consequat ad. Sint et Lorem duis aliqua sit irure magna nulla quis. Mollit nostrud laboris officia labore proident culpa dolor consectetur nostrud qui do exercitation.',
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
    );
  }
}
