import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:skills_pe/screens/tournaments/models/expansion_item.dart';
import 'package:skills_pe/screens/tournaments/widgets/edit_match_card.dart';
import 'package:skills_pe/sharedWidgets/buttons/filled_btn.dart';
import '../../sharedWidgets/cross_timer_appbar.dart';
import 'package:skills_pe/models/match_model.dart';

class EditMatches extends StatefulWidget {
  const EditMatches({Key? key}) : super(key: key);

  @override
  State<EditMatches> createState() => _EditMatchesState();
}

class _EditMatchesState extends State<EditMatches> {
  final List<Item> _expansionItem = generateItems(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: navigationWithTimer(context, "Edit Matches", null),
        body: Column(children: [
          Expanded(
            child: ListView(
                padding: const EdgeInsets.all(10),
                children: _expansionItem.map<Widget>((Item item) {
                  return Column(
                    children: [
                      ExpandablePanel(
                        theme: const ExpandableThemeData(
                            iconPlacement: ExpandablePanelIconPlacement.left,
                            iconColor: Colors.black,
                            iconPadding: EdgeInsets.fromLTRB(10, 20, 0, 0)),
                        header: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                          child: Text(
                            item.headerValue!,
                            style: const TextStyle(
                                color: Colors.black, fontFamily: 'Inter'),
                          ),
                        ),
                        collapsed: const Text(''),
                        expanded: Column(
                          children: [
                            for (Match listItem in item.expandedList!)
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Column(
                                  children: [
                                    EditMatchCard(
                                      matchDetails: listItem,
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                      )
                    ],
                  );
                }).toList()),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FilledBtn(
                  label: "Save",
                  onPressed: () => {},
                  backgroundColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ))
        ]));
  }
}
