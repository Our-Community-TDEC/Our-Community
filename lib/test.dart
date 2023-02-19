import 'package:cloud_firestore/cloud_firestore.dart';


void main() {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final docRef = firestore.collection("user").doc("5Jy5XzC0CLXCXy4IQTWOdgp98UA3");
  late Map<String, dynamic> data;
  docRef.get().then(
    (DocumentSnapshot doc) {
      data = doc.data() as Map<String, dynamic>;
    },
    onError: (e) => print("Error getting document: $e"),
  );

}