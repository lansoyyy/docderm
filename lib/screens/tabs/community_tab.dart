import 'package:docderm/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CommunityTab extends StatelessWidget {
  const CommunityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 600,
          height: 600,
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < 5; i++)
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
                                  text: 'John Doe',
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
                              text:
                                  'Nulla consectetur exercitation minim culpa sunt id consectetur dolor consequat cillum enim. Eu magna cupidatat dolor consequat ipsum sint nulla enim ea reprehenderit exercitation. Aliqua reprehenderit deserunt ad sint labore excepteur nulla ut ullamco mollit. Officia dolore cillum eu non excepteur ullamco excepteur amet sit pariatur minim sint. Lorem commodo cupidatat eiusmod qui est culpa Lorem.',
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
        ),
        const SizedBox(
          width: 20,
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
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
                          for (int i = 0; i < 5; i++)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    minRadius: 35,
                                    maxRadius: 35,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: 'Superman Group',
                                        fontSize: 24,
                                        fontFamily: 'Bold',
                                      ),
                                      TextWidget(
                                        text: '24,000 members',
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
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
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
                          for (int i = 0; i < 5; i++)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    minRadius: 35,
                                    maxRadius: 35,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: 'Superman Group',
                                        fontSize: 24,
                                        fontFamily: 'Bold',
                                      ),
                                      TextWidget(
                                        text: '24,000 members',
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
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.join_inner_sharp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
