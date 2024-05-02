import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_pe/screens/challenge_detail/bloc/challenge_detail_bloc.dart';
import 'package:skills_pe/screens/challenge_detail/respository/challenge_detail_repository.dart';
import 'package:skills_pe/screens/challenge_detail/widgets/expansion_collapsing_panel.dart';
import 'package:skills_pe/sharedWidgets/show_progressDialog_with_message.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/date_utility.dart';
import 'package:skills_pe/utility/utility.dart';

class ChallengeInfoScreen extends StatefulWidget {
  final String? challengeId;
  const ChallengeInfoScreen({Key? key, required this.challengeId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChallengeInfoScreenState();
}

class _ChallengeInfoScreenState extends State<ChallengeInfoScreen>
    with AutomaticKeepAliveClientMixin {
  final ChallengeDetailBloc challengeDetailBloc =
      ChallengeDetailBloc(ChallengeDetailRepository());
  bool isExpanded = false;

  @override
  void initState() {
    challengeDetailBloc
        .add(ChallengeDetailInitEvent(challengeId: widget.challengeId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer(
        bloc: challengeDetailBloc,
        listener: (context, state) {
          if (state is ChallengeDetailFailureState) {
            showSnackBar(context, state.errorMessage);
          }
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is ChallengeDetailLoadingState) {
            return const ShowProgressDialogWithMessage(
              message: LOADING,
            );
          } else if (state is ChallengeDetailSuccessState) {
            var challengeDetail = state.challengeDetailResponse;
            return SingleChildScrollView(
                child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
              ),
              child: Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(challengeDetail.title ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: HexColor("#0A121A"),
                                      fontSize: 24,
                                      height: 1.4,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600))),
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                              flex: 1,
                              child: SizedBox.square(
                                  dimension: 70,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: HexColor("#F9F9F9"),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(
                                                0xFFEEEEEE), // Color of the shadow
                                            spreadRadius: 1, // Spread radius
                                            blurRadius: 8, // Blur radius
                                            offset: Offset(
                                                0, 6), // Offset of the shadow
                                          )
                                        ]),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          challengeDetail.challengeEmoji!,
                                          style: const TextStyle(fontSize: 30),
                                        )),
                                  )))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          '${convertServerDate(challengeDetail.startTime!, MMM_DD_YYYY_FORMAT)} - ${convertServerDate(challengeDetail.endTime!, MMM_DD_YYYY_FORMAT)}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Sora-SemiBold",
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              fontSize: 14),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.only(top: 28),
                        color: HexColor("#F2F2F2"),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        CHALLENGEGOAL,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/note.svg",
                                      height: 25,
                                      width: 25,
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  challengeDetail.description ?? "",
                                  style: TextStyle(
                                      color: HexColor("#5A5A5A"),
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                      height: 1.7,
                                      fontWeight: FontWeight.w300),
                                ),
                              ]),
                        ),
                      ),
                      Card(
                          margin: const EdgeInsets.only(top: 15),
                          color: Theme.of(context).primaryColor,
                          shadowColor: Colors.black,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                const Expanded(
                                    child: Text(CHALLENGEFEES,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Sora-Bold",
                                            fontSize: 16,
                                            height: 1.5,
                                            fontWeight: FontWeight.w600))),
                                Text(
                                  '₹${challengeDetail.participationFee?.toInt().toString()}'
                                  "",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Sora-Bold",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      ExpansionCollapseWidget(
                        userType: CHALLENGERS,
                        challengeId: widget.challengeId!,
                        participantList: state.challengersList,
                      ),
                      ExpansionCollapseWidget(
                          userType: MODERATORS,
                          challengeId: widget.challengeId!,
                          participantList: state.moderatorList),
                      ExpansionCollapseWidget(
                        userType: MOTIVATORS,
                        challengeId: widget.challengeId!,
                        participantList: state.motivatorList,
                      )
                    ]),
              ),
            ));
          } else {
            return Container();
          }
        });
  }

  @override
  bool get wantKeepAlive => true;
}
