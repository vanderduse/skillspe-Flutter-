import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/sharedWidgets/chip.dart';
import 'package:skills_pe/sharedWidgets/vertical_separator.dart';

class NotificationCard extends StatelessWidget {
  final String item;

  const NotificationCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset("assets/icons/notification.svg"),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 2,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: TextChip(
                          text: 'Moderator',
                          backgroundColor: Color(0xffF5F5F5),
                          textColor: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "02 Oct 2023",
                            style: TextStyle(color: Color(0xff5C6068)),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              'Details',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const VerticalSeparator()
        ],
      ),
    );
  }
}
