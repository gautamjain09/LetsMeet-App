import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:lets_meet/services/auth_methods.dart';
import 'package:lets_meet/services/firestore_methods.dart';

class JitsiMeetMethods {
  final AuthMethods authMethods = AuthMethods();
  final FireStoreMethods fireStoreMethods = FireStoreMethods();

  void createMeeting({
    required String roomName,
    required bool isAudiomuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      String name;
      if (username.isEmpty) {
        name = authMethods.user.displayName!;
      } else {
        name = username;
      }

      var options = JitsiMeetingOptions(
        room: roomName,
      )
        ..userDisplayName = name
        ..userEmail = authMethods.user.email
        ..userAvatarURL = authMethods.user.photoURL
        ..audioMuted = isAudiomuted
        ..videoMuted = isVideoMuted;

      // Adding to history in Firestore
      fireStoreMethods.addMeetingHistory(roomName);

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print(error.toString());
    }
  }
}
