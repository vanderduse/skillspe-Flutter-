import 'package:flutter/material.dart';
import 'package:skills_pe/screens/quiz/main.dart';
import 'package:skills_pe/sharedWidgets/buttons/unfilled_btn.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/date_utility.dart';
import 'package:skills_pe/screens/home_screens/model/list_quizzes_response.dart';
import 'package:skills_pe/utility/constants.dart';

class QuizCard extends StatelessWidget {
  final QuizzesListResponse? item;
  final String? backgroundColor;

  const QuizCard({super.key, required this.item, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final quizStatus = formatQuizCardDate(item?.scheduledTime);
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
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0.0),
      child: Column(
        children: [
          Expanded(
            flex: 3, // dividing space according to desired ratio (40% : 60%)
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xfffd5ccff),
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
                  ),
                ),
              ),
            ),
          ),
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
                    margin: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      quizStatus,
                      style: TextStyle(
                        color: quizStatus == CAPITAL_LIVE
                            ? Colors.red
                            : Color(0xFF5C6068),
                        fontSize: quizStatus == CAPITAL_LIVE ? 14.0 : 12.0,
                        fontWeight: quizStatus == CAPITAL_LIVE
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
                          padding: const EdgeInsets.all(3.0),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFDF0CE),
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
                            const SizedBox(width: 16),
                            UnFilledBtn(
                              label: PLAY,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          QuizHome(quizId: item?.id ?? "")),
                                );
                              },
                            )
                          ],
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
