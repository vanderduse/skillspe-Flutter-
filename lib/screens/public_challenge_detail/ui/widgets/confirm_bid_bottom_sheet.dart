import 'package:flutter/material.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/bidding_confirmed_screen.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/custom_checkbox.dart';
import 'package:skills_pe/utility/constants.dart';

class ConfirmBidBottomSheet extends StatefulWidget {
  final BuildContext parentContext;

  const ConfirmBidBottomSheet({super.key, required this.parentContext});
  @override
  State<StatefulWidget> createState() => _ConfirmBidBottomSheet();
}

class _ConfirmBidBottomSheet extends State<ConfirmBidBottomSheet> {
  bool isConditionAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.36,
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 50, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 1.5)),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                    ),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Yes | ${RUPEE}5",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "You're contributing",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          height: 1,
                          color: Color.fromRGBO(63, 63, 63, 1)),
                    ),
                  )),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "${RUPEE}100",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          height: 1.8,
                          color: Color.fromRGBO(118, 115, 115, 1)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter",
                    height: 1.3,
                    fontSize: 12),
                'Warning: Lorem ipsum dolor sit amet consectetur. Lorem graa volutpat dui sollicitudin sociis feugiat diam to dui sollicitudin.'),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: Stack(
                children: [
                  Positioned(
                      left: 0,
                      right: 320,
                      child: CustomCheckbox(
                        checkboxSize: 1.5,
                        checked: isConditionAccepted,
                        onChange: (value) {
                          setState(() {
                            isConditionAccepted = value!;
                          });
                        },
                      )),
                  const Positioned(
                      left: 50,
                      top: 10,
                      right: 0,
                      child: Text(
                        'Lorem ipsum dolor sit amet consectetur. Lorem gravida volutpat dui sollicitudin sociis feugiat diam..',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.2,
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FilledBtn(
                label: "Confim your bid ->",
                onPressed: () {
                  Navigator.of(widget.parentContext).pop();
                  Navigator.push(
                      widget.parentContext,
                      MaterialPageRoute(
                        builder: (context) => const BiddingConfirmedScreen(),
                      ));
                },
                backgroundColor: Theme.of(context).primaryColor,
                textColor: Colors.white)
          ],
        ),
      ),
    );
  }
}
