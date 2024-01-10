import 'package:flutter/material.dart';
import 'package:skills_pe/sharedWidgets/quiz_card.dart';
import 'package:skills_pe/screens/view_all/ui/view_all_quiz.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> data;

  QuizWidget({
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Handle the 'View All' button tap
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewAllQuiz()),
                  );
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: Color(0xFF8C50F6), // Customize text color
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 240, // Set a fixed height for the horizontal ListView
          child: Container(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 80% of screen width
                  margin: EdgeInsets.symmetric(
                    horizontal: index == 0
                        ? 16.0
                        : (index == data.length - 1 ? 16.0 : 10.0),
                  ),
                  child: QuizCard(
                    item: data[index],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
