import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_pe/screens/challenge_detail/bloc/challenge_detail_bloc.dart';
import 'package:skills_pe/screens/challenge_detail/respository/challenge_detail_repository.dart';
import 'package:skills_pe/screens/challenge_detail/ui/model_bottom_sheet.dart';
import 'package:skills_pe/sharedWidgets/filled_btn.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/date_utility.dart';
import 'package:skills_pe/utility/utility.dart';

class ChallengeDetailTab extends StatefulWidget {
  final String? challengeId;
  const ChallengeDetailTab({super.key, required this.challengeId});

  @override
  State<StatefulWidget> createState() => _ChallengeDetailTabState();
}

class _ChallengeDetailTabState extends State<ChallengeDetailTab>
    with AutomaticKeepAliveClientMixin {
  final ChallengeDetailBloc challengeDetailBloc =
      ChallengeDetailBloc(ChallengeDetailRepository());
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
          if (state is ChallengeDetailLoadingState) {
            buildShowDialog(context);
          } else {
            Navigator.of(context).pop();
          }
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is ChallengeDetailSuccessState) {
            var _challengeDetail = state.challengeDetailResponse;
            return Container(
              color: const Color.fromARGB(255, 245, 240, 240),
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(children: [
                const Text(GENERAL_DETAILS,
                    style: TextStyle(color: Colors.black)),
                Card(
                  margin: const EdgeInsets.only(top: 10),
                  color: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _challengeDetail.title!,
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                _challengeDetail.challengeEmoji!,
                                style: const TextStyle(fontSize: 25),
                              )
                            ],
                          ),
                          challengeDetailContainer(
                              CHALLENGEGOAL, _challengeDetail.description!),
                          challengeDetailContainer(DURATION,
                              '${convertServerDate(_challengeDetail.startTime!)} - ${convertServerDate(_challengeDetail.endTime!)}'),
                          challengeDetailContainer(FEES,
                              '₹${_challengeDetail.participationFee!.round().toString()}'),
                        ]),
                  ),
                ),
                invitationCards(
                    CHALLENGERS,
                    'assets/images/cup.svg',
                    () => {
                          showModalBottomSheet<dynamic>(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return const ModelBottomSheet();
                              })
                        }),
                invitationCards(MODERATORS, 'assets/images/cup.svg',
                    () => {print('invite 2')}),
                invitationCards(MOTIVATORS, 'assets/images/cup.svg',
                    () => {print('invite 3')}),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 40,
                      child: FilledBtn(
                        textColor: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                        onPressed: () {},
                        label: SHARE,
                      ),
                    ),
                  ),
                )
              ]),
            );
          } else {
            return Container();
          }
        });
  }

  Widget challengeDetailContainer(String label, String description) {
    return Container(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Color.fromARGB(255, 139, 135, 135)),
            ),
            Text(description),
          ],
        ));
  }

  Widget invitationCards(
      String label, String iconPath, Function onPressedCallback) {
    List RandomImages = [
      'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
      'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
      'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
      'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528'
    ];
    return Card(
      margin: const EdgeInsets.only(top: 20),
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Row(children: [
          SvgPicture.asset(
            iconPath,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < RandomImages.length; i++)
                      Align(
                        widthFactor: 0.6,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundImage: NetworkImage(RandomImages[i]),
                        ),
                      )
                  ],
                ),
              ],
            ),
          )),
          TextButton(
            onPressed: () {
              onPressedCallback();
            },
            child: const Text('+ Invite'),
          )
        ]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
