import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_pe/screens/public_challenge_detail/models/bidding_history_item.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/bidding_history_view_item.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn_with_icon.dart';
import 'package:skills_pe/utility/constants.dart';

class BiddingHistoryAnimatedView extends StatefulWidget {
  final String? status;
  final BoxConstraints constraints;
  final List<BiddingHistoryItem> biddingHistoryList;
  final Function() _onBidMorePressed;

  const BiddingHistoryAnimatedView(this.constraints, this.biddingHistoryList,
      this.status, this._onBidMorePressed,
      {super.key});

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

  Widget _expandWidget() {
    return widget.biddingHistoryList.isNotEmpty
        ? InkWell(
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
                : SvgPicture.asset("assets/icons/arrow_drop_down_circle.svg"),
          )
        : const SizedBox();
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
                          _expandWidget(),
                        ],
                      ),
                      Expanded(
                        // Wrap ListView.builder in an Expanded widget
                        child: widget.biddingHistoryList.isEmpty
                            ? const Center(
                                child: Text('No History available'),
                              )
                            : ListView.builder(
                                itemCount: widget.biddingHistoryList
                                    .length, // Define the item count
                                itemBuilder: (context, index) {
                                  return BiddingHistoryItemView(
                                      widget.biddingHistoryList[index]);
                                },
                              ),
                      )
                    ],
                  ),
                ),
              ),
              widget.biddingHistoryList.isNotEmpty &&
                      widget.status?.toLowerCase() == LIVE.toLowerCase()
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 30),
                      child: FilledBtnWithIcon(
                          iconPath: Icons.arrow_right_alt,
                          label: "Bid More",
                          onPressed: widget._onBidMorePressed,
                          backgroundColor: Theme.of(context).primaryColor,
                          textColor: Colors.white),
                    )
                  : const SizedBox()
            ],
          ),
        ));
  }
}
