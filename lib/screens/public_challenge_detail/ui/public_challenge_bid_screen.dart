import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_pe/screens/home_screens/model/list_public_challenges_response.dart';
import 'package:skills_pe/screens/public_challenge_detail/bloc/public_challenge_detail_bloc.dart';
import 'package:skills_pe/screens/public_challenge_detail/repository/public_challenge_detail_repository.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/bidding_confirmed_screen.dart';
import 'package:skills_pe/sharedWidgets/bid_percentage_bar.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/public_challenge_description.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/bid_options.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/date_utility.dart';
import 'package:skills_pe/utility/utility.dart';

// ignore: must_be_immutable
class PublicChallengeBidScreen extends StatefulWidget {
  PublicChallengesItemResponse? item;
  PublicChallengeBidScreen(this.item, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PrivateChallengeInfoScreenState();
}

class _PrivateChallengeInfoScreenState extends State<PublicChallengeBidScreen>
    with AutomaticKeepAliveClientMixin {
  String challengeStatus = 'Live';
  bool isYesSelected = true;
  late PublicChallengeDetailBloc _biddingBloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _biddingBloc = PublicChallengeDetailBloc(PublicChallengeDetailRepository());
    if (widget.item?.status?.toLowerCase() != LIVE.toLowerCase()) {
      _biddingBloc.add(GetBidAggregate(widget.item?.id));
    }
  }

  void confirmBid(int bidAmount, PublicOptions options) {
    _biddingBloc.add(ConfirmBidEvent(
        challengeId: widget.item!.id!,
        bidAmount: bidAmount,
        bidOptions: options,
        participantsDetails: widget.item?.participationDetails));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer(
        bloc: _biddingBloc,
        listener: (context, state) async {
          if (state is LoadingState) {
            showProgressDialog(context, state.loaderMessage);
          }
          if (state is ResponseFailureState) {
            Navigator.of(context).pop();
            showSnackBar(context, state.errorMessage);
          }

          if (state is ResponseSuccessState) {
            Navigator.of(context).pop();
          }
          if (state is ConfirmBidSuccessState) {
            var result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BiddingConfirmedScreen(),
              ),
            );
            if (result != null) {
              _biddingBloc.add(GetChallengeDetailEvent(widget.item?.id!));
            }
          }
          if (state is GetChallengeDetailSuccessState) {
            setState(() {
              widget.item = state.challengeDetail;
            });
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(
                  30), // Adding margin to the parent container
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title at the top aligned to the left
                  Text(
                    widget.item?.description ?? "",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  BidPercentageBar(
                    firstPartPercentage:
                        widget.item?.bidRatios?[1].bidPercent ?? 0,
                    secondPartPercentage:
                        widget.item?.bidRatios?[0].bidPercent ?? 0,
                  ),
                  const SizedBox(height: 20),
                  PublicChallengeDescription(
                    challengeDescription: widget.item?.description,
                    challengeStatus: widget.item?.status,
                    challengeDate: formatChallengeDate(
                        widget.item?.startTime, widget.item?.endTime),
                    source: widget.item?.source,
                    totalTraders: widget.item?.totalTraders ?? 0,
                  ),
                  const SizedBox(height: 20),
                  BidOptions(
                      status: widget.item?.status,
                      options: widget.item?.options,
                      confirmBid: confirmBid,
                      bidRatios: widget.item?.bidRatios,
                      bloc: _biddingBloc),
                ],
              ),
            ),
          );
        });
  }
}
