import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/home_screens/model/list_public_challenges_response.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/main.dart';
import 'package:skills_pe/utility/constants.dart';

class PublicChallengeCard extends StatelessWidget {
  final PublicChallengesItemResponse? item;

  const PublicChallengeCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PublicChallengeInfoScreen(
              item: item,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        margin: const EdgeInsets.symmetric(
          vertical: 15.0,
        ),
        width: cardWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 5, 10, 5),
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF34C1),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          height: 10.0,
                          width: 10.0,
                          child: SvgPicture.asset(
                            'assets/icons/question.svg',
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      item?.title ?? '',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5.0),
                      child: Center(
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xFF8247DF),
                              width: 1.0,
                            ),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/share.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      item?.description ?? "",
                      textAlign: TextAlign.left,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // BidPercentageBar(
                  //   firstPartPercentage:
                  //       _getPercentage(NO, item?.bidRatios).toDouble(),
                  //   secondPartPercentage:
                  //       _getPercentage(YES, item?.bidRatios).toDouble(),
                  // ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Add onPressed functionality for button No
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                          const Size(120.0, 45.0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(
                              color: Color(0xFFFF34C1),
                              width: 1.5,
                            ),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFFF34C1)),
                      ),
                      child: Text(
                        '$NO  ₹${_getOptionValue(NO, item?.options)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add onPressed functionality for button Yes
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                          const Size(120.0, 45.0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF8247DF)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: Text(
                        '$YES  ₹${_getOptionValue(YES, item?.options)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int _getPercentage(String label, List<PublicOptions>? bidRatios) {
  if (bidRatios != null) {
    for (var option in bidRatios) {
      if (option.label?.toLowerCase() == label.toLowerCase()) {
        return option.bidPercent?.toInt() ?? 0;
      }
    }
  }
  return 0;
}

double _getOptionValue(String label, List<PublicOptions>? options) {
  if (options != null) {
    for (var option in options) {
      if (option.label?.toLowerCase() == label.toLowerCase()) {
        return option.bidValue ?? 0.0;
      }
    }
  }
  return 0.0;
}
