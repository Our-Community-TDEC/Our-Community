import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


class OtherComplains_Logic {
  void RaiseComplain() {
    TextEditingController complaint_title = TextEditingController();
    TextEditingController complaint_description = TextEditingController();
    FirebaseFirestore firestore = FirebaseFirestore.instance;

      String title = complaint_title.text.trim();
      String description = complaint_description.text.trim();

      complaint_description.clear();
      complaint_title.clear();
      
      if (title != '' && description != '' ) {
        firestore.collection('complaint').doc('1').set({"title": title, "descriptoin": description}); 
      }
  }
}