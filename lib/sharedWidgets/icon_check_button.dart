import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconCheckButton extends StatelessWidget {
  final String iconPath;
  final Color iconAccentColor;
  final bool isSelected;
  final String value;
  final VoidCallback onTap;

  const IconCheckButton({
    Key? key,
    required this.iconPath,
    required this.iconAccentColor,
    required this.isSelected,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isSelected ? iconAccentColor : Color(0xFFD0D1DA),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              child: Stack(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: ShapeDecoration(
                      color: iconAccentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      iconPath,
                      width: 16,
                      height: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
