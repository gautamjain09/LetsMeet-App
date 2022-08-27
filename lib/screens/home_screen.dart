import 'package:flutter/material.dart';
import 'package:lets_meet/utils/colors.dart';
import 'package:lets_meet/widgets/meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  void onPageChanged(int pageIndex) {
    setState(() {
      _pageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meet & Chat",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MeetingButton(
                text: "New Meeting",
                onPressed: () {},
                iconData: Icons.videocam,
              ),
              MeetingButton(
                  text: "Join Meeting",
                  onPressed: () {},
                  iconData: Icons.add_box_rounded),
              MeetingButton(
                text: "Schedule Meet",
                onPressed: () {},
                iconData: Icons.calendar_today,
              ),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.grey.shade300,
        unselectedItemColor: Colors.grey.shade600,
        unselectedFontSize: 11,
        selectedFontSize: 11,
        onTap: onPageChanged,
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank),
            label: "Meet & Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock_outlined),
            label: "Meetings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
