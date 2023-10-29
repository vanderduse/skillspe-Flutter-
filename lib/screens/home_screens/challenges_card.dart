import 'package:flutter/material.dart';

import 'home_screen_1.dart';

class ChallengeCard extends StatelessWidget {
  final ChallengeItem challengeItem;

  const ChallengeCard({super.key, required this.challengeItem});

  @override
  Widget build(BuildContext context) {
        return Container(
          margin: const EdgeInsets.all(20),
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(-2, 2),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(image: AssetImage('assets/challenges1.png')),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          challengeItem.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 20,
                            margin: const EdgeInsets.fromLTRB(0, 10, 100, 0),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:  Center(
                              child: Text(  challengeItem.title),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                            child: Text(challengeItem.title),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Bid'),
                  ),
                ),
              ),
            ],
          ),
        );

  }
}