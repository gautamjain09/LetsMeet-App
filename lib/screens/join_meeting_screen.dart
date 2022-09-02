import "package:flutter/material.dart";
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:lets_meet/services/auth_methods.dart';
import 'package:lets_meet/services/jitsi_meet_methods.dart';
import 'package:lets_meet/utils/colors.dart';
import 'package:lets_meet/widgets/meeting_options.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods authMethods = AuthMethods();
  final JitsiMeetMethods jitsiMeetMethods = JitsiMeetMethods();

  late TextEditingController meetingIdController = TextEditingController();
  late TextEditingController nameController = TextEditingController();

  bool isAudiomuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(
      text: authMethods.user.displayName,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners(); // to Avoids memory leeks
  }

  joinMeeting() {
    jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudiomuted: isAudiomuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text, // toString will give error
    );
  }

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
          // <---- Join Meeting with Room ID and Name ---->

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
          const SizedBox(height: 2),
          Container(
            color: secondaryBackgroundColor,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Name",
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Join",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),

          // <-------- Mute Audio, Video options -------------->

          MeetingOptions(
            text: "Mute Audio",
            isMute: isAudiomuted,
            onChanged: (val) {
              setState(() {
                isAudiomuted = val;
              });
            },
          ),
          const SizedBox(height: 2),
          MeetingOptions(
            text: "Turn off Video",
            isMute: isVideoMuted,
            onChanged: (val) {
              setState(() {
                isVideoMuted = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
