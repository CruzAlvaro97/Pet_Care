import 'package:flutter/material.dart';
import 'package:pet_society/src/utils/index_utils.dart';

class ModalAlertWidget extends StatelessWidget {
  const ModalAlertWidget({
    this.icon,
    this.title,
    this.message,
    this.actions = const [],
    Key? key,
  }) : super(key: key);

  final Widget? icon;
  final String? title;
  final String? message;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      icon: icon,
      title: title == null
          ? null
          : Text(
              title!,
              textAlign: TextAlign.center,
            ),
      titleTextStyle: CustomTextStyle.text.copyWith(
        color: Colors.black,
        fontSize: 20,
      ),
      content: message == null
          ? null
          : Text(
              message!,
              textAlign: TextAlign.center,
            ),
      contentTextStyle: CustomTextStyle.text.copyWith(
        color: Colors.grey,
        fontSize: 17,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsOverflowButtonSpacing: 8.0,
      actions: actions,
    );
  }
}
