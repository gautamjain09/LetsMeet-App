import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:lets_meet/services/auth_methods.dart';

class JitsiMeetMethods {
  final AuthMethods authMethods = AuthMethods();

  void createMeeting({
    required String roomName,
    required bool isAudiomuted,
    required bool isVideoMuted,
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      var options = JitsiMeetingOptions(
        room: roomName,
      )
        ..userDisplayName = authMethods.user.displayName
        ..userEmail = authMethods.user.email
        ..userAvatarURL = authMethods.user.photoURL
        ..audioMuted = isAudiomuted
        ..videoMuted = isVideoMuted;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print(error.toString());
    }
  }
}
