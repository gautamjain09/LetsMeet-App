import "package:flutter/material.dart";
import 'package:lets_meet/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        minimumSize: Size(
          MediaQuery.of(context).size.width / 2,
          45,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
      ),
    );
  }
}
