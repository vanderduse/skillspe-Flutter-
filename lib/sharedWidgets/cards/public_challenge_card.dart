import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/home_screens/model/list_public_challenges_response.dart';

class PublicChallengeCard extends StatelessWidget {
  final PublicChallengesListResponse? item;

  const PublicChallengeCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;

    return Container(
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
                    item?.title ??
                        '', // Use item.title if available, otherwise fallback to 'Challenge Name'
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: item?.bidRatios?.asMap().entries.map((entry) {
                        final index = entry.key;
                        final option = entry.value;
                        final bidPercent = option.bidPercent ?? 0.0;
                        final color = index.isEven
                            ? const Color(0xFFFF34C1)
                            : const Color(0xFF8247DF);

                        return Expanded(
                          flex: 50,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 6,
                                decoration: BoxDecoration(
                                  color:
                                      color, // Alternate color based on index
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                    topLeft: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 32),
                                  Text(
                                    '${bidPercent.toStringAsFixed(0)}%',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      })?.toList() ??
                      [],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: item?.options?.asMap().entries.map((entry) {
                      final index = entry.key;
                      final option = entry.value;
                      final backgroundColor =
                          index.isEven ? Colors.white : const Color(0xFF8247DF);
                      final borderColor = index.isEven
                          ? const Color(0xFFFF34C1)
                          : const Color(0xFF8247DF);

                      return TextButton(
                        onPressed: () {
                          // Add onPressed functionality for each option
                        },
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(120.0, 45.0),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: borderColor,
                                width: 1.5, // Adjust border width as needed
                              ),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(backgroundColor),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              index.isEven
                                  ? const Color(0xFFFF34C1)
                                  : Colors.white),
                        ),
                        child: Text(
                          '${option.label}  ₹${option.value}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    })?.toList() ??
                    [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
