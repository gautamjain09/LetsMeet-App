import "package:flutter/material.dart";
import 'package:lets_meet/utils/colors.dart';

class MeetingOptions extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChanged;
  const MeetingOptions({
    Key? key,
    required this.text,
    required this.isMute,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: secondaryBackgroundColor,
      height: 55,
      // width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Switch(
            value: isMute,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
