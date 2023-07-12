import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class sendnotification {
  String refferalcode = "";
  String noti_token = "";
  Future<String> getrefferalcode() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    refferalcode = snapshot.get("refferalcode");
    noti_token = snapshot.get("notification_tokens");
    print(refferalcode);
    return snapshot.get("role");
  }

  Future<void> sendNotificationToAllUsers(String message) async {
    await getrefferalcode();
    // bool hasCustomSounds = await FlutterRingtonePlayer.canCustomize;

    // Check if the user has provided privacy consent
    bool userProvidedPrivacyConsent =
        await OneSignal.shared.userProvidedPrivacyConsent();
    if (!userProvidedPrivacyConsent) {
      print(
          "User has not provided privacy consent yet. Cannot send notification.");
      return;
    }
    // Retrieve all users from the 'users' collection in Firestore
    QuerySnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('refferalcode', isEqualTo: refferalcode)
        .get();

    List<String> playerIds = [];
    userSnapshot.docs.forEach((doc) {
      Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
      String? playerId = userData['notification_tokens'] as String?;
      if (playerId != null) {
        print("object");
        playerIds.add(playerId);
      }
    });

    // Send the notification to all users using OneSignal
    var response = await OneSignal.shared.postNotification(
      OSCreateNotification(
        playerIds: playerIds,
        content: message,
        androidSmallIcon: '@mipmap/ic_launcher',
      ),
    );
  }

  Future<void> sendServiceNotificationToAllUsers(
      String message, String role) async {
        await getrefferalcode();
    // bool hasCustomSounds = await FlutterRingtonePlayer.canCustomize;

    // Check if the user has provided privacy consent
    bool userProvidedPrivacyConsent =
        await OneSignal.shared.userProvidedPrivacyConsent();
    if (!userProvidedPrivacyConsent) {
      print(
          "User has not provided privacy consent yet. Cannot send notification.");
      return;
    }

    // Retrieve all users from the 'users' collection in Firestore
    QuerySnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('role', isEqualTo: role)
        .where('refferalcode', isEqualTo: refferalcode)
        .get();

    List<String> playerIds = [];
    userSnapshot.docs.forEach((doc) {
      Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
      String? playerId = userData['notification_tokens'] as String?;
      if (playerId != null) {
        playerIds.add(playerId);
      }
    });

    // Send the notification to all users using OneSignal
    var response = await OneSignal.shared.postNotification(
      OSCreateNotification(
        playerIds: playerIds,
        content: message,
        androidSmallIcon: '@mipmap/ic_launcher',
      ),
    );
  }

  Future<void> sendChatNotificationToAllUsers(String message) async {
    await getrefferalcode();

    // bool hasCustomSounds = await FlutterRingtonePlayer.canCustomize;

    // Check if the user has provided privacy consent
    bool userProvidedPrivacyConsent =
        await OneSignal.shared.userProvidedPrivacyConsent();
    if (!userProvidedPrivacyConsent) {
      print(
          "User has not provided privacy consent yet. Cannot send notification.");
      return;
    }

    // Retrieve all users from the 'users' collection in Firestore
    QuerySnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('user')
        .where('refferalcode', isEqualTo: refferalcode)
        .get();

    List<String> playerIds = [];
    userSnapshot.docs.forEach((doc) {
      Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
      String? playerId = userData['notification_tokens'] as String?;
      if (playerId != null) {
        print(noti_token + " noti_token");
        print(playerId + " playerId");
        if (noti_token != playerId) {
          playerIds.add(playerId);
        }
      }
    });

    // Send the notification to all users using OneSignal
    var response = await OneSignal.shared.postNotification(
      OSCreateNotification(
        playerIds: playerIds,
        content: message,
        androidSmallIcon: '@mipmap/ic_launcher',
      ),
    );
  }
}
