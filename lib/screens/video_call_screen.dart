import "package:flutter/material.dart";
import 'package:lets_meet/services/auth_methods.dart';
import 'package:lets_meet/utils/colors.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods authMethods = AuthMethods();

  late TextEditingController meetingIdController = TextEditingController();
  late TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: authMethods.user.displayName);
    super.initState();
  }

  joinMeeting() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Join Meeting",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: secondaryBackgroundColor,
            child: TextField(
              controller: meetingIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Room ID",
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            color: secondaryBackgroundColor,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Name",
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          const SizedBox(height: 15),
          InkWell(
            // onTap: joinMeeting(),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Join",
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
