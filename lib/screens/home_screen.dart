import 'package:flutter/material.dart';
import 'package:lets_meet/screens/history_meeting_screen.dart';
import 'package:lets_meet/screens/meeting_screen.dart';
import 'package:lets_meet/services/auth_methods.dart';
import 'package:lets_meet/utils/colors.dart';
import 'package:lets_meet/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  List<Widget> pages = [
    const MeetingScreen(),
    const HistoryMeetingScreen(),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Contacts will be shown here",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        CustomButton(
          text: "Log Out",
          onPressed: () => AuthMethods().signOut(),
        ),
      ],
    ),
  ];

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
      body: pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.grey.shade300,
        unselectedItemColor: Colors.grey.shade600,
        unselectedFontSize: 11,
        selectedFontSize: 11,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
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
