import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/home_screens/model/list_public_challenges_response.dart';
import 'package:skills_pe/screens/public_challenge_detail/bloc/public_challenge_detail_bloc.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/confirm_bid_bottom_sheet.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/custom_piechart.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/text_thumb_shape.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn_with_icon.dart';
import 'package:skills_pe/utility/constants.dart';

class BidOptions extends StatefulWidget {
  final String? status;
  final PublicChallengeDetailBloc bloc;
  final List<PublicOptions>? options;
  final List<PublicOptions>? bidRatios;
  final Function(int bidAmount, PublicOptions) confirmBid;

  const BidOptions(
      {Key? key,
      required this.status,
      required this.options,
      required this.confirmBid,
      required this.bidRatios,
      required this.bloc})
      : super(key: key);

  @override
  BidOptionsState createState() => BidOptionsState();
}

class BidOptionsState extends State<BidOptions> {
  String? _activeCard,
      firstLabel,
      secondLabel; // Variable to track the active card
  double _sliderValue = 0;

  @override
  void initState() {
    super.initState();
    _activeCard =
        widget.options?[0].label ?? YES; // Initialize active card from props
    firstLabel = _activeCard;
    secondLabel = widget.options?[1].label ?? NO;
  }

  void _confirmBid() {
    widget.confirmBid(widget.bloc.calculatedValue,
        widget.bloc.getBidOption(widget.options, _activeCard));
  }

  int _getBidValue(String? label) {
    if (widget.bloc.isLiveStatus(widget.status)) {
      if (_activeCard == label) {
        return widget.bloc
            .calculateBiddingValue(widget.options, _activeCard, _sliderValue);
      } else {
        return 0;
      }
    } else if (widget.bloc.state is GetBidAggregateSuccessState) {
      var state = widget.bloc.state as GetBidAggregateSuccessState;
      var item = state.bidAggregateItem
          ?.firstWhere((element) => element.label == label);
      return item?.totalApprovedAmount?.toInt() ?? 0;
    } else {
      return 0;
    }
  }

  int _getReturnValue(String? label) {
    if (widget.bloc.isLiveStatus(widget.status)) {
      if (_activeCard == label) {
        return widget.bloc
            .calculateWinUpTo(widget.options, _activeCard, _sliderValue);
      } else {
        return 0;
      }
    } else if (widget.bloc.state is GetBidAggregateSuccessState) {
      var state = widget.bloc.state as GetBidAggregateSuccessState;
      var item = state.bidAggregateItem
          ?.firstWhere((element) => element.label == label);
      return widget.status?.toLowerCase() == COMPLETED.toLowerCase()
          ? item?.totalGainAmount?.toInt() ?? 0
          : item?.totalBidQtys?.toInt() ?? 0;
    } else {
      return 0;
    }
  }

  double _getPercentage(String label) {
    if (widget.bidRatios != null) {
      for (var option in widget.bidRatios!) {
        if (option.label?.toLowerCase() == label.toLowerCase()) {
          return option.bidPercent == 0 ? 50 : option.bidPercent ?? 0;
        }
      }
    }
    return 0;
  }

  void _confirmBidBottomSheet(
      BuildContext parentContext, String activeCard, int calculatedValue) {
    showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ConfirmBidBottomSheet(
            parentContext: context,
            activeCard: activeCard,
            firstLabel: firstLabel ?? YES,
            calculatedValue: calculatedValue,
            biddingValue: widget.bloc.biddingValue,
            confirmBid: _confirmBid);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth =
        MediaQuery.of(context).size.width - 60; // Get the screen width
    return Column(
      children: [
        Row(
          children: [
            // Add some spacing between the cards
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (_activeCard != firstLabel &&
                      widget.bloc.isLiveStatus(widget.status)) {
                    setState(() {
                      _activeCard = firstLabel; // Set the active card to 'Yes'
                    });
                  }
                },
                child: Card(
                  margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: _activeCard == firstLabel ||
                              !widget.bloc.isLiveStatus(widget.status)
                          ? const Color(0xFF7E56DA)
                          : const Color.fromARGB(157, 170, 170, 170),
                      width: 1,
                    ),
                  ),
                  elevation: _activeCard == firstLabel &&
                          widget.bloc.isLiveStatus(widget.status)
                      ? 8
                      : 0, // Add elevation if active
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFF7E56DA), // Header background color
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0), // Padding inside the container
                        child: Center(
                          child: Text(
                            '$firstLabel  |  $RUPEE${widget.options?.firstWhere((element) => element.label == firstLabel).bidValue?.toInt() ?? 0}',
                            style: const TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 13, // Text size
                              fontWeight: FontWeight.bold, // Text weight
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.bloc.getBidValueLabel(widget.status),
                            style: const TextStyle(
                              color: Color(0xFF3F3F3F), // Text color
                              fontSize: 16, // Text size
                            ),
                          ),
                          const SizedBox(
                              height: 5), // Add spacing between texts
                          Center(
                            child: Text(
                              '$RUPEE${_getBidValue(firstLabel)}',
                              style: const TextStyle(
                                color: Color(0xFF8A8A8A), // Text color
                                fontSize: 24, // Text size
                                fontWeight: FontWeight.bold, // Text weight
                              ),
                            ),
                          ),
                          const SizedBox(height: 8), // Add vertical spacing
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Divider(
                              color: Color.fromARGB(
                                  113, 158, 158, 158), // Divider color
                              thickness: 1.6, // Divider thickness
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.bloc.getBidReturnLabel(widget.status),
                                style: const TextStyle(
                                  color: Color(0xFF7E56DA), // Text color
                                  fontSize: 16, // Text size
                                ),
                              ),
                              const SizedBox(
                                  height: 5), // Add spacing between texts
                              Center(
                                child: Text(
                                  '$RUPEE${_getReturnValue(firstLabel)}', // Your value here
                                  style: const TextStyle(
                                    color: Color(0xFF7E56DA), // Text color
                                    fontSize: 24, // Text size
                                    fontWeight: FontWeight.bold, // Text weight
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  height: 20), // Add vertical spacing
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (_activeCard != secondLabel &&
                      widget.bloc.isLiveStatus(widget.status)) {
                    setState(() {
                      _activeCard = secondLabel;
                    });
                  }
                },
                child: Card(
                  margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: _activeCard == secondLabel ||
                              !widget.bloc.isLiveStatus(widget.status)
                          ? const Color(0xFFFF34C1)
                          : const Color.fromARGB(157, 170, 170, 170),
                      width: 1,
                    ),
                  ),
                  elevation: _activeCard == secondLabel &&
                          widget.bloc.isLiveStatus(widget.status)
                      ? 8
                      : 0, // Add elevation if active
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF34C1), // Header background color
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0), // Padding inside the container
                        child: Center(
                          child: Text(
                            '$secondLabel  |  $RUPEE${widget.options?.firstWhere((element) => element.label == secondLabel).bidValue?.toInt() ?? 0}',
                            style: const TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 13, // Text size
                              fontWeight: FontWeight.bold, // Text weight
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.bloc.getBidValueLabel(widget.status),
                            style: const TextStyle(
                              color: Color(0xFF3F3F3F), // Text color
                              fontSize: 16, // Text size
                            ),
                          ),
                          const SizedBox(
                              height: 5), // Add spacing between texts
                          Center(
                            child: Text(
                              '$RUPEE${_getBidValue(secondLabel)}', // Your value here
                              style: const TextStyle(
                                color: Color(0xFF8A8A8A), // Text color
                                fontSize: 24, // Text size
                                fontWeight: FontWeight.bold, // Text weight
                              ),
                            ),
                          ),
                          const SizedBox(height: 8), // Add vertical spacing
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Divider(
                              color: Color.fromARGB(
                                  113, 158, 158, 158), // Divider color
                              thickness: 1.6, // Divider thickness
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.bloc.getBidReturnLabel(widget.status),
                                style: const TextStyle(
                                  color: Color(0xFFFF34C1), // Text color
                                  fontSize: 16, // Text size
                                ),
                              ),
                              const SizedBox(
                                  height: 5), // Add spacing between texts
                              Center(
                                child: Text(
                                  '$RUPEE${_getReturnValue(secondLabel)}', // Your value here
                                  style: const TextStyle(
                                    color: Color(0xFFFF34C1), // Text color
                                    fontSize: 24, // Text size
                                    fontWeight: FontWeight.bold, // Text weight
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  height: 20), // Add vertical spacing
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        widget.bloc.isLiveStatus(widget.status)
            ? Stack(
                children: [
                  Card(
                    surfaceTintColor: Colors.white,
                    color: Colors
                        .white, // Set the background color of the card to white
                    elevation: 0.25, // Shadow size
                    margin: const EdgeInsets.symmetric(
                        vertical: 10), // Margin around the card
                    child: Padding(
                      padding:
                          const EdgeInsets.all(15.0), // Padding inside the card
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize
                            .min, // Fit content in the smallest space possible
                        children: <Widget>[
                          const Text(
                            QUANTITY,
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Inter", // Text size
                                fontWeight: FontWeight.w500,
                                height: 1 // Text weight
                                ),
                          ),
                          // Space between text and button
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/stacks.svg",
                                height: 24,
                                width: 24,
                                color: _activeCard == secondLabel
                                    ? const Color.fromRGBO(255, 52, 193, 0.85)
                                    : Theme.of(context).primaryColor,
                              ),
                              Expanded(
                                  child: SliderTheme(
                                      data: SliderThemeData(
                                          activeTrackColor: _activeCard ==
                                                  secondLabel
                                              ? const Color.fromRGBO(
                                                  255, 52, 193, 0.85)
                                              : Theme.of(context).primaryColor,
                                          thumbColor: _activeCard == firstLabel
                                              ? const Color.fromRGBO(
                                                  255, 52, 193, 0.85)
                                              : Theme.of(context).primaryColor,
                                          thumbShape: const TextThumbShape(
                                              text: '<>', thumbRadius: 12)),
                                      child: Slider(
                                        min: 0,
                                        max: 10,
                                        value: _sliderValue,
                                        onChanged: (value) {
                                          setState(() {
                                            _sliderValue = value;
                                          });
                                        },
                                      ))),
                              Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text("${_sliderValue.toInt()}"))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.decelerate,
                      right: _activeCard == secondLabel
                          ? screenWidth / 4.8
                          : screenWidth / 1.4,
                      bottom: 100,
                      top: 0,
                      child: SvgPicture.asset(
                        "assets/icons/polygon.svg",
                      )),
                ],
              )
            : widget.status?.toLowerCase() == 'results_pending'
                ? Card(
                    surfaceTintColor: Colors.white,
                    color: Colors
                        .white, // Set the background color of the card to white
                    elevation: 0.25, // Shadow size
                    margin: const EdgeInsets.symmetric(
                        vertical: 10), // Margin around the card
                    child: Padding(
                      padding:
                          const EdgeInsets.all(15.0), // Padding inside the card
                      child: Row(
                        children: [
                          CustomPieChart(
                            yesPercent: _getPercentage(firstLabel ?? YES),
                            noPercent: _getPercentage(secondLabel ?? NO),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: RichText(
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            text: const TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Winning Chances: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'These probabilities are derived from an analysis of public sentiments on the platform, actual results may vary.',
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
        const SizedBox(height: 10),
        widget.status?.toLowerCase() != COMPLETED.toLowerCase()
            ? FilledBtnWithIcon(
                isButtonEnabled: widget.bloc.calculatedValue != 0 ||
                    !widget.bloc.isLiveStatus(widget.status),
                label: widget.bloc.isLiveStatus(widget.status)
                    ? CONFIRM_YOUR_BID
                    : NOTIFY_ME,
                iconPath: widget.bloc.isLiveStatus(widget.status)
                    ? Icons.arrow_right_alt
                    : Icons.notifications_active,
                onPressed: () {
                  widget.bloc.isLiveStatus(widget.status)
                      ? _confirmBidBottomSheet(context, _activeCard ?? YES,
                          widget.bloc.calculatedValue)
                      : {};
                },
                backgroundColor: Theme.of(context).primaryColor,
                textColor: Colors.white)
            : const SizedBox()
      ],
    );
  }
}
