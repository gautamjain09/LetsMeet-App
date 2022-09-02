import 'dart:math';
import "package:flutter/material.dart";
import 'package:lets_meet/services/jitsi_meet_methods.dart';
import 'package:lets_meet/widgets/meeting_button.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(1000000) + 1000000).toString();

    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudiomuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) async {
    Navigator.pushNamed(context, '/join-meet-route');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MeetingButton(
              text: "New Meeting",
              iconData: Icons.videocam,
              onPressed: () {
                createNewMeeting();
              },
            ),
            MeetingButton(
              text: "Join Meeting",
              iconData: Icons.add_box_rounded,
              onPressed: () {
                joinMeeting(context);
              },
            ),

            // Pending To be Done.....
            // MeetingButton(
            //   text: "Schedule Meet",
            //   iconData: Icons.calendar_today,
            //   onPressed: () {},
            // ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              "Create/Join Meeting with just a click!",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
