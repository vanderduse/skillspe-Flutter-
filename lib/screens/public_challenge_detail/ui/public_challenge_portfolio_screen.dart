import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/screens/public_challenge_detail/bloc/public_challenge_detail_bloc.dart';
import 'package:skills_pe/screens/public_challenge_detail/repository/public_challenge_detail_repository.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/bidding_history_animated_view.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/challenge_porfolio_cards.dart';
import 'package:skills_pe/screens/public_challenge_detail/ui/widgets/challenge_status.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/date_utility.dart';
import 'package:skills_pe/utility/utility.dart';

class ChallengePortfolioScreen extends StatefulWidget {
  final String _challengeId;
  final String? _challengeStatus;
  final String? _challengeDescription;
  final Function() _onBidMorePressed;
  const ChallengePortfolioScreen(this._challengeId, this._challengeStatus,
      this._challengeDescription, this._onBidMorePressed,
      {super.key});

  @override
  State<StatefulWidget> createState() => _ChallengePortfolioState();
}

class _ChallengePortfolioState extends State<ChallengePortfolioScreen>
    with AutomaticKeepAliveClientMixin {
  late PublicChallengeDetailBloc _challengePortfolioBloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _challengePortfolioBloc =
        PublicChallengeDetailBloc(PublicChallengeDetailRepository());
    _challengePortfolioBloc
        .add(PortfolioDataEvent(challengeId: widget._challengeId));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer(
        bloc: _challengePortfolioBloc,
        listener: (context, state) {
          if (state is PortfolioLoadingState) {
            showProgressDialog(context, LOADING);
          } else if (state is PortfolioResponseFailureState) {
            showSnackBar(context, state.errorMessage);
            Navigator.of(context).pop();
          } else {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          if (state is PortfolioResponseSuccessState) {
            var portfolioDetail = state.portfolioDetail;
            return LayoutBuilder(builder: (context, constraints) {
              return Container(
                margin: const EdgeInsets.only(top: 20),
                child: Stack(
                  children: [
                    Positioned(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: Text(
                                        maxLines: 2,
                                        widget._challengeDescription ?? '',
                                        style: TextStyle(
                                            color: HexColor("#1A2022"),
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11,
                                            height: 1.3),
                                      ))),
                              ChallengeStatus(widget._challengeStatus),
                            ],
                          ),
                        ),
                        Center(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Card(
                                margin:
                                    const EdgeInsets.fromLTRB(30, 20, 0, 20),
                                color: Theme.of(context).primaryColor,
                                elevation: 1,
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            "assets/icons/send_money.svg",
                                            height: 40,
                                            width: 25,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text(
                                              "Total \nReturns",
                                              style: TextStyle(
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  height: 1.3),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        "$RUPEE${portfolioDetail.returnAmount}",
                                        style: const TextStyle(
                                            fontFamily: "Inter",
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        "${convertServerDateToMMMdd(portfolioDetail.createdAt)} - Today",
                                        style: const TextStyle(
                                            fontFamily: "Inter",
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              )),
                              ChallengePortfolioCard(portfolioDetail)
                            ],
                          ),
                        ),
                      ],
                    )),
                    BiddingHistoryAnimatedView(
                        constraints,
                        state.biddingHistoryList,
                        widget._challengeStatus,
                        widget._onBidMorePressed),
                  ],
                ),
              );
            });
          } else {
            return Container();
          }
        });
  }
}
