import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skills_pe/screens/challenge_detail/model/participant_detail_response.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:skills_pe/utility/utility.dart';
import 'package:skills_pe/screens/challenge_detail/ui/invite_challengers_bottom_sheet.dart';

class ExpansionCollapseWidget extends StatefulWidget {
  final String userType;
  final String challengeId;
  final List<ParticipantDetailResponse> participantList;
  const ExpansionCollapseWidget(
      {Key? key, required this.userType, required this.challengeId, required this.participantList})
      : super(key: key);

  @override
  ExpansionCollapseWidgetState createState() => ExpansionCollapseWidgetState();
}

class ExpansionCollapseWidgetState extends State<ExpansionCollapseWidget> {
  double _padding = 16.0;
  double _horitonzalPadding = 15.0;
  Color _bg_color = HexColor("#F5F0FF");
  bool _isListVisible = false;
  double _heightOfList = 0;

  @override
  void initState() {
    super.initState();
    _isListVisible =
        widget.title == CHALLENGERS; // Adjust this condition as needed
    if (_isListVisible) {
      _padding = 0.0;
      _horitonzalPadding = 7.0;
      _bg_color = Colors.white;
      _heightOfList = 90.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            child: GestureDetector(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 300), () {
                  if (_isListVisible) {
                    setState(() {
                      _padding = 16.0;
                      _horitonzalPadding = 15.0;
                      _bg_color = HexColor("#F5F0FF");
                      _isListVisible = false;
                      _heightOfList = 0;
                    });
                  } else {
                    setState(() {
                      _padding = 0.0;
                      _horitonzalPadding = 7.0;
                      _bg_color = Colors.white;
                      _isListVisible = true;
                      _heightOfList = 90.0;
                    });
                  }
                });
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: _bg_color),
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: _padding, horizontal: _horitonzalPadding),
                child: Row(
                  children: <Widget>[
                    Text(
                      widget.userType,
                      style: TextStyle(
                          color: HexColor("#6F6F6F"),
                          fontFamily: "Sora-Medium",
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      child: Transform.rotate(
                        angle:
                            _isListVisible ? 180 * 3.1415926535897932 / 180 : 0,
                        child: SvgPicture.asset(
                            'assets/icons/arrow_drop_down.svg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 10, vertical: _isListVisible ? 15 : 5),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            height: _heightOfList,
            color: Colors.white,
            child: getParticipantsListWidget(_isListVisible),
          ),
        ),
      ],
    );
  }

  Widget getParticipantsListWidget(bool isListVisible) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.participantList.length,
        itemBuilder: (context, index) {
          var isAsset = index == 0;
          String finalText = (widget.participantList[index]
                      .getFullName()
                      .length <=
                  7)
              ? widget.participantList[index].getFullName()
              : '${widget.participantList[index].getFullName().substring(0, 7)}...'; // Boolean to determine if the image is an asset
          return GestureDetector(
              onTap: () {
            if (index == 0) {
              _showShareBottomSheet(context, widget.userType, widget.challengeId);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10, vertical: isListVisible ? 1 : 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.all(isAsset ? 14 : 0),
                  decoration: BoxDecoration(
                      color: HexColor('#F2F2F2'), shape: BoxShape.circle),
                  child: ClipOval(
                      child: isAsset
                          ? SvgPicture.asset("assets/icons/add.svg")
                          : Image.network(
                              widget.participantList[index].profileImgUrl!,
                              fit: BoxFit.cover,
                            )),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(isAsset ? INVITE : finalText,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Inter",
                        height: 1.8,
                        fontWeight:
                            index == 0 ? FontWeight.w400 : FontWeight.w600)),
              ],
            ),
          );
        },
      ),
    );
  }
}

// function to show the bottom sheet modal
void _showShareBottomSheet(BuildContext context, String userType, String challengeId) {
  showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return InviteChallengersBottomSheet(
        userType: userType,
        challengeId: challengeId,
      );
    },
  );
}
