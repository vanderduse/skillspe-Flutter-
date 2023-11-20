import 'package:flutter/material.dart';

import '../../models/quiz_model.dart';

class QuizCard extends StatelessWidget {
  final Quiz quiz;

  const QuizCard({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          height: 100,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffE6E1FF), Color(0xffD5CCFF)],
                begin: Alignment.bottomRight),
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/quiz1.png')),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 90, 20, 0),
          height: 130,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quiz.description,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quiz.startDate,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("${quiz.participants}+Participants"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('${quiz.price}\$'),
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Bid'))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
