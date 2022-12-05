import 'package:final_year_project/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class Emergency_Logic {
  Medical_Emergency_Help() {
    print(
        "emergency_logic.Medical_Emergency_Help: Medical Help Button was clicked.");
  }

  void shownotification() async {
    AndroidNotificationDetails andr_details = AndroidNotificationDetails(
        "channelId", "channelName",
        enableVibration: true,
        priority: Priority.max,
        importance: Importance.max);
    DarwinNotificationDetails ios_details = DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notidetail =
        NotificationDetails(android: andr_details, iOS: ios_details);

    await notification.show(1, "title", "body", notidetail);
  }

  Electrical_Emergency_Help() {
    print(
        "emergency_logic.Electrical_Emergency_Help: Electrical Help Button was clicked.");
  }

  Car_Emergency_Help() {
    print("emergency_logic.Car_Emergency_Help: Car Help Button was clicked.");
  }

  Fire_Emergency_Help() {
    print("emergency_logic.Fire_Emergency_Help: Fire Help Button was clicked.");
  }

  Police_Contact() {
    print("emergency_logic.Police_Contact: Calling the Police.");
  }

  Ambulance_Contact() {
    print("emergency_logic.Ambulance_Contact: Calling the Ambulance.");
  }

  Security_Contact() {
    print("emergency_logic.Security_Contact: Calling the Security.");
  }

  MainGate_Contact() {
    print("emergency_logic.MainGate_Contact: Calling the Main Gate.");
  }

  Emergency_SOS() {
    print(
        "emergency_logic.Emergency_SOS: SOS!!!!!!!!!! CONTACTING EVERYONE!!!!!!!!!.");
  }
}
