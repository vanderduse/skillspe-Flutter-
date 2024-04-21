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
import 'package:skills_pe/utility/constants.dart';

class InviteChallengersBottomSheet extends StatefulWidget {
  final String userType;
  final String challengeId;

  const InviteChallengersBottomSheet({
    Key? key,
    required this.userType,
    required this.challengeId,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InviteChallengersBottomSheetState();
}

class _InviteChallengersBottomSheetState
    extends State<InviteChallengersBottomSheet> {
  late ChallengeDetailBloc _challengeDetailUsersListBloc;
  late ChallengeDetailBloc _inviteUsersBloc;

  Map<String, bool> checkedUsers = {};
  bool isAnyUserChecked = false;
  bool qrCodeActive = false;

  // Array to store IDs of selected users
  List<String> selectedUserList = [];

  @override
  void initState() {
    super.initState();
    ChallengeDetailRepository usersListRepository = ChallengeDetailRepository();
    ChallengeDetailRepository inviteUsersRepository =
        ChallengeDetailRepository();

    _challengeDetailUsersListBloc = ChallengeDetailBloc(usersListRepository);
    _inviteUsersBloc = ChallengeDetailBloc(inviteUsersRepository);

    _challengeDetailUsersListBloc
        //removing the last letter 's'
        .add(ChallengeDetailFetchUsersListEvent(
            userType: widget.userType
                .substring(0, widget.userType.length - 1)
                .toUpperCase()));
  }

  void _handleInviteClick() {
    // Dispatch the InviteUsersEvent with the selected user IDs
    _inviteUsersBloc.add(ChallengeDetailInviteUsersEvent(
      userIds: selectedUserList,
      challengeId: widget.challengeId,
      //removing the last letter 's'
      particapantsType: widget.userType
          .substring(0, widget.userType.length - 1)
          .toUpperCase(),
    ));
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
                        INVITE_CHALLENGERS,
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
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
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
                          child: BlocConsumer<ChallengeDetailBloc,
                              ChallengeDetailState>(
                            bloc: _challengeDetailUsersListBloc,
                            listener: (context, state) {
                              if (state is UsersListFailureState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.errorMessage),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is UsersListLoadingState) {
                                //TODO: replace with skeleton loader
                                return const CircularProgressIndicator();
                              } else if (state is UsersListSuccessState) {
                                return ListView.builder(
                                  itemCount: state.usersList.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
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
                                                'https://via.placeholder.com/40x40'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                          '${state.usersList[index].firstName ?? ''} ${state.usersList[index].lastName ?? ''}'),
                                      trailing: Checkbox(
                                        value: checkedUsers[state
                                                .usersList[index].userId] ??
                                            false,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            // Update checkbox status
                                            checkedUsers[state.usersList[index]
                                                .userId!] = value!;
                                            // Update selectedUserList
                                            if (value!) {
                                              selectedUserList.add(state
                                                  .usersList[index].userId!);
                                            } else {
                                              selectedUserList.remove(state
                                                  .usersList[index].userId);
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
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),

                        // Divider
                        const Divider(
                          height: 0,
                        ),

                        Visibility(
                          visible: isAnyUserChecked,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                            child: BlocBuilder<ChallengeDetailBloc,
                                ChallengeDetailState>(
                              bloc: _inviteUsersBloc,
                              builder: (context, state) {
                                if (state is InviteUsersLoadingState) {
                                  return FilledBtn(
                                      textColor: Colors.white,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      onPressed: _handleInviteClick,
                                      label: 'Inviting...');
                                } else if (state is InviteUsersFailureState) {
                                  // Show error snackbar

                                  return const SizedBox();
                                } else if (state is InviteUsersSuccessState) {
                                  // Show success snackbar
                                  Navigator.of(context).pop();
                                  return const SizedBox();
                                } else {
                                  return FilledBtn(
                                    textColor: Colors.white,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    onPressed: _handleInviteClick,
                                    label: '+ Invite',
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

            // Bottom row of buttons
            Padding(
              padding:
                  EdgeInsets.fromLTRB(20, isAnyUserChecked ? 10 : 20, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBottomButton(
                    iconPath: 'assets/icons/link.svg',
                    onPressed: () {
                      _copyToClipboardAndHapticFeedback("CHALLENGE LINK");
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
                      _launchWhatsApp("CHALLENGE LINK");
                    },
                  ),
                  _buildBottomButton(
                    iconPath: 'assets/icons/sms.svg',
                    onPressed: () {
                      _sendSMS("CHALLENGE LINK");
                    },
                  ),
                  _buildBottomButton(
                    iconPath: 'assets/icons/menu.svg',
                    onPressed: () {
                      _shareContent("CHALLENGE LINK");
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
                QR_CODE_DESCRIPTION,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            QrImageView(
              data: 'CHALLENGE LINK',
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

  void _copyToClipboardAndHapticFeedback(String link) {
    String challengeMessage = '''
$link
''';
    Clipboard.setData(ClipboardData(text: challengeMessage));
    HapticFeedback.heavyImpact();
  }

  void _launchWhatsApp(String link) async {
    String challengeMessage = '''
Hey, come join the challenge on SkillsPe now!
🚀 Convert your skills into wealth 🚀

Click on the link below to join:
$link
''';
    String url = "https://wa.me/?text=$challengeMessage";
    launchUrl(
      Uri.parse(url),
    );
    HapticFeedback.heavyImpact();
  }

  void _sendSMS(String link) async {
    String message = '''
Hey, come join the challenge on SkillsPe now! 
      
Click on the link below to join: $link''';

    String url = 'sms:?body=$message';
    launchUrl(
      Uri.parse(url),
    );
    HapticFeedback.heavyImpact();
  }

  void _shareContent(String link) {
    String message = '''
Hey, come join the challenge on SkillsPe now!

Click on the link below to join: 
$link
''';
    Share.share(message);
    HapticFeedback.heavyImpact();
  }
}
