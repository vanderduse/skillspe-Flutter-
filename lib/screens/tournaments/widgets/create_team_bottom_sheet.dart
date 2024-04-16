import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class BottomSheetManager {
  static void showGenericBottomSheet(
      BuildContext context, Widget body, String title,
      {String iconPath = ""}) {
    WoltModalSheet.show<void>(
      context: context,
      pageListBuilder: (modalSheetContext) {
        final textTheme = Theme.of(context).textTheme;
        return [
          _buildBottomSheetPage(
              modalSheetContext, textTheme, body, title, iconPath),
        ];
      },
      modalTypeBuilder: (context) {
        final size = MediaQuery.of(context).size.width;
        return size < 600 ? WoltModalType.bottomSheet : WoltModalType.dialog;
      },
      onModalDismissedWithBarrierTap: () {
        debugPrint('Closed modal sheet with barrier tap');
      },
      maxDialogWidth: 560,
      minDialogWidth: 400,
      minPageHeight: 0.0,
      maxPageHeight: 0.9,
    );
  }

  static void closeModalSheet(BuildContext context) {
    Navigator.of(context).pop();
  }

  static WoltModalSheetPage _buildBottomSheetPage(
      BuildContext modalSheetContext,
      TextTheme textTheme,
      Widget body,
      String title,
      String iconPath) {
    return WoltModalSheetPage(
      hasSabGradient: false,
      backgroundColor: Colors.white,
      leadingNavBarWidget: Container(
          padding: const EdgeInsets.fromLTRB(20.0, 28.0, 20, 16),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SvgPicture.asset("assets/icons/cup.svg"),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                height: 0,
              ),
            )
          ])),
      isTopBarLayerAlwaysVisible: true,
      topBar: Container(decoration: const BoxDecoration(color: Colors.white)),
      trailingNavBarWidget: IconButton(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        icon: const Icon(Icons.close),
        onPressed: Navigator.of(modalSheetContext).pop,
      ),
      child: body,
    );
  }
}
