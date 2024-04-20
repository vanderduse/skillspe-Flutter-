import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';
import 'package:skills_pe/utility/constants.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:skills_pe/screens/challenge_detail/bloc/challenge_detail_bloc.dart';
import 'package:skills_pe/screens/challenge_detail/respository/challenge_detail_repository.dart';

class InviteChallengersBottomSheet extends StatefulWidget {
  const InviteChallengersBottomSheet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InviteChallengersBottomSheetState();
}

class _InviteChallengersBottomSheetState
    extends State<InviteChallengersBottomSheet> {
  late ChallengeDetailBloc _challengeDetailUsersListBloc;
  Map<String, bool> checkedUsers = {};
  bool isAnyUserChecked = false;
  bool qrCodeActive = false;

  // Array to store IDs of selected users
  List<String> selectedUserList = [];

  @override
  void initState() {
    super.initState();
    ChallengeDetailRepository usersListRepository = ChallengeDetailRepository();
    _challengeDetailUsersListBloc = ChallengeDetailBloc(usersListRepository);
    _challengeDetailUsersListBloc
        .add(ChallengeDetailFetchUsersListEvent(userType: 'MOTIVATOR'));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Top header
            Container(
              width: MediaQuery.of(context).size.width,
              height: 0.1,
              color: Colors.black,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/cup.svg',
                        height: 26,
                        width: 26,
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Invite Challengers',
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromARGB(40, 0, 0, 0),
              thickness: 1,
              height: 10,
            ),

            qrCodeActive
                ? _buildQRCodeSection()
                : Expanded(
                    child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: SEARCH_YOUR_FRIEND,
                            contentPadding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: BlocBuilder<ChallengeDetailBloc,
                            ChallengeDetailState>(
                          bloc: _challengeDetailUsersListBloc,
                          builder: (context, state) {
                            if (state is UsersListLoadingState) {
                              return CircularProgressIndicator();
                            } else if (state is UsersListSuccessState) {
                              return ListView.builder(
                                itemCount: state.usersList.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(state
                                                  .usersList[index]
                                                  .profileImgUrl ??
                                              ''),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                        '${state.usersList[index].firstName ?? ''} ${state.usersList[index].lastName ?? ''}'),
                                    trailing: Checkbox(
                                      value: checkedUsers[
                                              state.usersList[index].userId] ??
                                          false,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          // Update checkbox status
                                          checkedUsers[state.usersList[index]
                                              .userId!] = value!;
                                          // Update selectedUserList
                                          if (value!) {
                                            selectedUserList.add(
                                                state.usersList[index].userId!);
                                          } else {
                                            selectedUserList.remove(
                                                state.usersList[index].userId);
                                          }
                                          // Check if any user is selected
                                          isAnyUserChecked =
                                              selectedUserList.isNotEmpty;
                                        });
                                      },
                                      shape: const CircleBorder(),
                                    ),
                                  );
                                },
                              );
                            } else if (state is UsersListFailureState) {
                              return Text(state.errorMessage);
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                      Visibility(
                        visible: isAnyUserChecked,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
                          child: FilledBtn(
                            textColor: Colors.white,
                            backgroundColor: Theme.of(context).primaryColor,
                            onPressed: () {},
                            label: '+ Invite',
                          ),
                        ),
                      ),
                    ],
                  )),

            // Divider
            const Divider(),

            // Bottom row of buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBottomButton(
                    iconPath: 'assets/icons/link.svg',
                    onPressed: () {
                      _copyToClipboardAndHapticFeedback("Challenge Copied!");
                    },
                  ),
                  _buildBottomButton(
                    iconPath: 'assets/icons/qr-code.svg',
                    onPressed: () {
                      setState(() {
                        qrCodeActive = !qrCodeActive;
                        // Clear selected users when switching to QR code
                        selectedUserList.clear();
                        // Uncheck all checkboxes
                        checkedUsers.clear();
                        // Reset isAnyUserChecked
                        isAnyUserChecked = false;
                      });
                      HapticFeedback.heavyImpact();
                    },
                  ),
                  _buildBottomButton(
                    iconPath: 'assets/icons/whatsapp.svg',
                    onPressed: () {
                      _launchWhatsApp("Testing whatsapp challenge sharing!");
                    },
                  ),
                  _buildBottomButton(
                    iconPath: 'assets/icons/sms.svg',
                    onPressed: () {
                      _sendSMS("Challenge Copied!");
                    },
                  ),
                  _buildBottomButton(
                    iconPath: 'assets/icons/menu.svg',
                    onPressed: () {
                      _shareContent("challenge copied");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQRCodeSection() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                'Scan QR to get the challenge link',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            QrImageView(
              data: 'Link to the challenge',
              version: QrVersions.auto,
              size: 300.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton(
      {required String iconPath, required void Function() onPressed}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 237, 247),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(iconPath),
      ),
    );
  }

  void _copyToClipboardAndHapticFeedback(String text) {
    String challengeMessage = '''
[Link to the challenge]
''';
    Clipboard.setData(ClipboardData(text: challengeMessage));
    HapticFeedback.heavyImpact();
  }

  void _launchWhatsApp(String text) async {
    String challengeMessage = '''
Hey, come join the challenge on SkillsPe now!
🚀 Convert your skills into wealth 🚀

Click on the link below to join:
[Link to the challenge]
''';
    String url = "https://wa.me/?text=$challengeMessage";
    launchUrl(
      Uri.parse(url),
    );
    HapticFeedback.heavyImpact();
  }

  void _sendSMS(String text) async {
    String message = '''
Hey, come join the challenge on SkillsPe now! 
      
Click on the link below to join: [Link to the challenge]''';

    String url = 'sms:?body=$message';
    launchUrl(
      Uri.parse(url),
    );
    HapticFeedback.heavyImpact();
  }

  void _shareContent(String text) {
    String message = '''
Hey, come join the challenge on SkillsPe now!

Click on the link below to join: 
[Link to the challenge]
''';
    Share.share(message);
    HapticFeedback.heavyImpact();
  }
}
