import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/tournaments/widgets/team_name_with_icon.dart';
import 'package:skills_pe/sharedWidgets/buttons/colored_outline_button.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';
import 'package:skills_pe/sharedWidgets/vertical_separator.dart';

class BiddingStepOneScreen extends StatefulWidget {
  const BiddingStepOneScreen({super.key});

  @override
  State<StatefulWidget> createState() => _BiddingStepOneState();
}

class _BiddingStepOneState extends State<BiddingStepOneScreen> {
  bool height = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ? 350 : null,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Color(0xFFF4F4F4)),
      child: _confirmBiddingUI(),
    );
  }

  Widget _biddingStepOneUI() {
    return Stack(
      children: [
        Opacity(
          opacity: 0.10,
          child: Container(
            width: 390,
            height: 107,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(1.00, 0.00),
                end: Alignment(-1, 0),
                colors: [Color(0xFFFF34F7), Color(0xFF4759FF)],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 70,
          child: SizedBox(
            width: 350,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 72,
                    padding: const EdgeInsets.all(16),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x19717C86),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Total Prize Pool',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF5C6068),
                                  fontSize: 11,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '\$200',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0A121A),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 72,
                    padding: const EdgeInsets.all(16),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x19717C86),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Total Participants',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF5C6068),
                                  fontSize: 11,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '132',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0A121A),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TeamNameWithIcon(teamName: "Team A", iconColor: "0xffFF5733"),
              const Text(
                'vs',
                style: TextStyle(
                  color: Color(0xFF5C6068),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              TeamNameWithIcon(teamName: "Team A", iconColor: "0xffFF5733"),
            ],
          ),
        ),
        Positioned(
            top: 160,
            left: 20,
            child: Container(
              width: 350,
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                shadows: const [
                  BoxShadow(
                    color: Color(0x19717C86),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Team E to win the match against  Team H ?",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  const VerticalSeparator(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ColoredOutlineButton(
                          text: 'Yes',
                          textColor: const Color(0xFF12B669),
                          buttonColor: const Color(0x0C12B669),
                          onTap: () {
                            // Handle button tap
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: ColoredOutlineButton(
                          text: 'No',
                          textColor: Colors.red, // Change the color as needed
                          buttonColor: Colors.red
                              .withOpacity(0.1), // Change the color as needed
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _confirmBiddingUI() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 350,
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              shadows: const [
                BoxShadow(
                  color: Color(0x19717C86),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Team E to win the match against  Team H ?",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.start,
                ),
                const VerticalSeparator(),
                ColoredOutlineButton(
                  text: 'Yes',
                  textColor: const Color(0xFF12B669),
                  buttonColor: const Color(0x0C12B669),
                  onTap: () {
                    // Handle button tap
                  },
                )
              ],
            ),
          ),
        ),
        const Text(
          "Bid Amount",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff0a121a),
            height: 19 / 16,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          "₹ 200",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 40,
            fontWeight: FontWeight.w400,
            color: Color(0xff0a121a),
            height: 48 / 40,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _selectAmountTextChip("50"),
              _selectAmountTextChip("100"),
              _selectAmountTextChip("200"),
            ],
          ),
        ),
        Container(
          width: 350,
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: ShapeDecoration(
            color: const Color(0xFFFDF0CE),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Row(
            children: [
              SvgPicture.asset("assets/icons/wallet.svg"),
              const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Wallet Balance',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF181201),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  )),
              const Spacer(),
              const Text('₹ 120',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF181201),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  )),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(15),
            child: FilledBtn(
                label: "Confirm",
                onPressed: () {},
                backgroundColor: Theme.of(context).primaryColor,
                textColor: Colors.white))
      ],
    );
  }

  Widget _selectAmountTextChip(String amount) {
    return Container(
      width: 64,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD0D1DA)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '₹ $amount',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
