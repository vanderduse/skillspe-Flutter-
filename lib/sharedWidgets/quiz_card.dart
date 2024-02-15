import 'package:flutter/material.dart';
import 'package:skills_pe/screens/quiz/main.dart';
import 'package:skills_pe/sharedWidgets/unfilled_btn.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/date_utility.dart';
import 'package:skills_pe/screens/home_screens/model/list_quizzes_response.dart';

class QuizCard extends StatelessWidget {
  final QuizzesListResponse? item;
  final String? backgroundColor; // Use nullable string for optional parameter

  const QuizCard({super.key, required this.item, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Shadow color
            spreadRadius: 1, // Spread radius
            blurRadius: 10, // Blur radius
            offset: const Offset(0, 5), // Shadow position
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0.0),
      child: Column(
        children: [
          Expanded(
            // Use Expanded instead of Container for flexible sizing
            flex: 3, // Divide space according to desired ratio (40% : 60%)
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFD5CCFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.network(
                    item?.banner ?? "",
                    width: 54,
                    height: 54,
                    // You can adjust the width and height as needed
                  ),
                ),
              ),
              // Add your desired content for the top section here
            ),
          ),
          // Bottom section with remaining space
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    item?.name ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                      height: 5), // Adding space between title and date

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      formatQuizCardDate(item?.scheduledTime),
                      style: TextStyle(
                        color: formatQuizCardDate(item?.scheduledTime) == 'LIVE'
                            ? Colors.red
                            : Color(0xFF5C6068),
                        fontSize:
                            formatQuizCardDate(item?.scheduledTime) == 'LIVE'
                                ? 14.0
                                : 12.0,
                        fontWeight:
                            formatQuizCardDate(item?.scheduledTime) == 'Live'
                                ? FontWeight.bold
                                : FontWeight.normal,
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          padding: const EdgeInsets.all(3.0), // Adding padding
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              item?.category ?? "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          // padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFDF0CE),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  '$RUPEE_SYMBOL ${item?.participationFee.toString() ?? ""}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  width: 16), // Adding space between containers
                              UnFilledBtn(
                                  label: PLAY,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => QuizHome(
                                                  quizId: item?.id ?? "",
                                                )));
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
