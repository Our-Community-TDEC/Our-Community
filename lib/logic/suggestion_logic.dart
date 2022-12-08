import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AddNewSuggestion {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

  void AddSuggestion() {
    TextEditingController suggestion_title = TextEditingController();
    TextEditingController suggestion_description = TextEditingController();
    String datetime = DateTime.now().toString();

    String title = suggestion_title.text.trim();
    String description = suggestion_description.text.trim();

    suggestion_description.clear();
    suggestion_title.clear();

    if (title != '' && description != '') {
      firestore
          .collection('suggestion')
          .add({"title": title, "description": description  , "time" : datetime});
    }
  }

  
}
