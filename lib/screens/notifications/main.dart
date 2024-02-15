import 'package:flutter/material.dart';
import 'package:skills_pe/screens/notifications/widgets/notification_card.dart';
import 'package:skills_pe/sharedWidgets/appBars/back_text_btn_appbar.dart';
import 'package:skills_pe/utility/constants.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animationOffset;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _notificationItems = ["hello1", "hello2", "hello3"];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animationOffset =
        Tween(begin: Offset(0.2, 0), end: Offset(0.0, 0)).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.decelerate),
    );
    _animationController.forward();
  }

  void _onDeleteNotification(int index, String item) {
    if (index >= 0 && index < _notificationItems.length) {
      final removedItem = _notificationItems.removeAt(index);

      _listKey.currentState?.removeItem(
        index,
        (context, animation) {
          return SizeTransition(
            sizeFactor: Tween<double>(begin: 0, end: 1.0).animate(animation),
            child: NotificationCard(item: removedItem),
          );
        },
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: navigationWithTextButton(context, NOTIFICATIONS, CLEAR_ALL, () {
        for (var i = _notificationItems.length - 1; i >= 0; i--) {
          _onDeleteNotification(i, _notificationItems[i]);
        }
      }),
      body: AnimatedList(
        padding: const EdgeInsets.all(20),
        key: _listKey,
        initialItemCount: _notificationItems.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: _animationOffset,
            child: NotificationCard(item: _notificationItems[index]),
          );
        },
      ),
    );
  }
}
