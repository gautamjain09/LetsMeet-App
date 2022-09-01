import "package:flutter/material.dart";
import 'package:lets_meet/services/firestore_methods.dart';

class HistoryMeetingScreen extends StatefulWidget {
  const HistoryMeetingScreen({Key? key}) : super(key: key);

  @override
  State<HistoryMeetingScreen> createState() => _HistoryMeetingScreenState();
}

class _HistoryMeetingScreenState extends State<HistoryMeetingScreen> {
  FireStoreMethods fireStoreMethods = FireStoreMethods();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: fireStoreMethods.getMeetingHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: ((context, index) => ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "Room Name: ${(snapshot.data! as dynamic).docs[index]['roomName']}",
                  ),
                ),
                subtitle: Text(
                  "Joined on ${((snapshot.data! as dynamic).docs[index]['createdTime'].toDate())}",
                ),
              )),
        );
      },
    );
  }
}
