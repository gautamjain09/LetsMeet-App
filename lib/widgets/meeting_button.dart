import "package:flutter/material.dart";
import 'package:lets_meet/utils/colors.dart';

class MeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final String text;
  const MeetingButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(15),
            ),
            width: 55,
            height: 55,
            child: Icon(
              iconData,
              color: Colors.white,
              size: 25,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
