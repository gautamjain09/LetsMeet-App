import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreMethods {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  // final User user = auth.currentUser!;

  void addMeetingHistory(String roomName) async {
    try {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('meetings')
          .add({
        'roomName': roomName,
        'createdTime': DateTime.now(),
      });
    } on FirebaseException catch (e) {
      print(e.message!);
    }
  }
}
