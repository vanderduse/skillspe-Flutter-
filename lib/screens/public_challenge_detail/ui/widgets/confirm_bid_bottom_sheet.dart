import 'package:flutter/material.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/custom_checkbox.dart';
import 'package:skills_pe/utility/constants.dart';

class ConfirmBidBottomSheet extends StatefulWidget {
  final BuildContext parentContext;
  final String activeCard, firstLabel;
  final int calculatedValue, biddingValue;
  final Function() confirmBid;

  const ConfirmBidBottomSheet(
      {super.key,
      required this.parentContext,
      required this.activeCard,
      required this.calculatedValue,
      required this.biddingValue,
      required this.firstLabel,
      required this.confirmBid});

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
                      color: widget.activeCard == widget.firstLabel
                          ? Theme.of(context).primaryColor
                          : const Color.fromRGBO(255, 52, 193, 0.85),
                      width: 1.5)),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: widget.activeCard == widget.firstLabel
                          ? Theme.of(context).primaryColor
                          : const Color.fromRGBO(255, 52, 193, 0.85),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "${widget.activeCard} | $RUPEE${widget.biddingValue}",
                            style: const TextStyle(color: Colors.white),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      '$RUPEE${widget.calculatedValue}',
                      style: const TextStyle(
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
              child: Row(
                children: [
                  CustomCheckbox(
                    checkboxSize: 1.5,
                    checked: isConditionAccepted,
                    onChange: (value) {
                      setState(() {
                        isConditionAccepted = value!;
                      });
                    },
                  ),
                  const Expanded(
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
                isButtonEnabled: isConditionAccepted,
                label: "Confirm your bid ->",
                onPressed: () {
                  Navigator.of(widget.parentContext).pop();
                  widget.confirmBid();
                },
                backgroundColor: Theme.of(context).primaryColor,
                textColor: Colors.white)
          ],
        ),
      ),
    );
  }
}
