import 'package:flutter/material.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';
import 'package:skills_pe/utility/constants.dart';

class InviteChallengersBottomSheet extends StatefulWidget {
  const InviteChallengersBottomSheet({super.key});

  @override
  State<StatefulWidget> createState() => _InviteChallengersBottomSheetState();
}

class _InviteChallengersBottomSheetState
    extends State<InviteChallengersBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 600,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width, // Width of the line
              height: 0.1, // Height of the line
              color: Colors.black, // Color of the line
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              color: const Color.fromARGB(255, 235, 211, 238),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                child: const Column(children: [
                  Text(
                    INVITE_CODE,
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "942052",
                    style: TextStyle(
                        fontFamily: "Inter",
                        letterSpacing: 11,
                        fontSize: 30,
                        color: Color.fromRGBO(70, 43, 156, 1),
                        fontWeight: FontWeight.w600),
                  ),
                ]),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: SEARCH_YOUR_FRIEND,
                    contentPadding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)))),
              ),
            ),
            Expanded(child: getListView()),
            const Divider(),
            Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
                child: FilledBtn(
                  textColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: () {},
                  label: INVITE,
                )),
          ],
        ));
  }

  Widget getListView() {
    return ListView.custom(childrenDelegate:
        SliverChildBuilderDelegate((BuildContext context, int index) {
      return ListTile(
        leading: const Icon(Icons.ac_unit),
        title: const Text("Shubham"),
        trailing: Checkbox(
          value: true,
          onChanged: (bool? value) {},
          shape: const CircleBorder(),
        ),
      );
    }));
  }
}
