import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});
  @override
  Size get preferredSize =>
      const Size.fromHeight(56.0); // Adjust the desired height

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AppBar(
      elevation: 0.3,
      shadowColor: Colors.black,
      automaticallyImplyLeading: false,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
      actions: [
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, width * 0.03, 0),
                child: Center(
                  child: TextButton(
                    child: const Text(
                      "Cancel",
                      style:
                          TextStyle(fontSize: 14, fontStyle: FontStyle.normal),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )),
          ],
        )
      ],
      surfaceTintColor: Colors.black,
    );
  }
}
