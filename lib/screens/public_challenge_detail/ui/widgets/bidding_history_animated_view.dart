import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/bidding_history_view_item.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';

class BiddingHistoryAnimatedView extends StatefulWidget {
  final BoxConstraints constraints;

  const BiddingHistoryAnimatedView(this.constraints, {super.key});

  @override
  State<StatefulWidget> createState() => _BiddingHistoryAnimatedView();
}

class _BiddingHistoryAnimatedView extends State<BiddingHistoryAnimatedView> {
  double _expandedHeight = 0.0;

  @override
  void initState() {
    super.initState();
  }

  void expandContainer() {
    setState(() {
      _expandedHeight = _expandedHeight == 0.0
          ? widget.constraints.maxHeight / 20
          : 0.0; // Set the desired expanded height
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        top: _expandedHeight == 0.0
            ? widget.constraints.maxHeight / 2.5
            : _expandedHeight,
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 0),
                color: Colors.white,
                elevation: 0,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                              child: Text(
                            "Bidding History",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )),
                          InkWell(
                            onTap: () {
                              expandContainer();
                            },
                            child: _expandedHeight == 0.0
                                ? Text(
                                    "See All",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Theme.of(context).primaryColor,
                                        fontFamily: "Inter",
                                        fontSize: 12,
                                        fontWeight: FontWeight
                                            .w900 // Set the text color and underline color here
                                        ),
                                  )
                                : SvgPicture.asset(
                                    "assets/icons/arrow_drop_down_circle.svg"),
                          ),
                        ],
                      ),
                      Expanded(
                        // Wrap ListView.builder in an Expanded widget
                        child: ListView.builder(
                          itemCount: 10, // Define the item count
                          itemBuilder: (context, index) {
                            return const BiddingHistoryItemView();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 30),
                child: FilledBtn(
                    label: "Bid More ->",
                    onPressed: () {},
                    backgroundColor: Theme.of(context).primaryColor,
                    textColor: Colors.white),
              )
            ],
          ),
        ));
  }
}
