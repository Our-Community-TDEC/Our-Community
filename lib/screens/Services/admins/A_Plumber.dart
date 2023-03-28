import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class A_Plumber extends StatefulWidget {
  const A_Plumber({super.key});

  @override
  State<A_Plumber> createState() => _A_PlumberState();
}

class _A_PlumberState extends State<A_Plumber> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController sloteController = new TextEditingController();
  TextEditingController timeHourController = new TextEditingController();
  TextEditingController timeMinuteController = new TextEditingController();
  @override
  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Add Details',
          textAlign: TextAlign.center,
        ),
        content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: mobileController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                ),
              ),
              TextField(
                controller: sloteController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'slote for a day',
                ),
              ),
              Text("time for a slot"),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: timeHourController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        labelText: 'Hour',
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Flexible(
                    child: TextField(
                      controller: timeMinuteController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        labelText: 'Minute',
                      ),
                    ),
                  ),
                ],
              )
            ]),
        actions: [
          TextButton(
              child: Text('Cancel'),
              onPressed: () {
                nameController.clear();
                mobileController.clear();
                Navigator.pop(context);
              }),
          TextButton(
              child: Text('Add Notice'),
              onPressed: () {
                add();
                Navigator.pop(context);
              })
        ],
      ),
    );
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void add() async {
    String name = nameController.text.trim();
    String mobile = mobileController.text.trim();
    String slot = sloteController.text.trim();
    String hour = timeHourController.text.trim();
    String minute = timeMinuteController.text.trim();
    if (name != "" || mobile != "") {
      firestore.collection("plumber").doc("plumberdetail").set({
        "name": name,
        "mobile": mobile,
        "slot":slot,
        "time": "$hour hr $minute min"
      }).then(
        (value) => {
          nameController.clear(),
          mobileController.clear(),
          sloteController.clear(),
          timeMinuteController.clear(),
          timeHourController.clear(),
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Data added"),
              backgroundColor: Colors.blue,
            ),
          ),
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("please enter all detail"),
        backgroundColor: Colors.blue,
      ));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddEventDialog(),
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          // TextField(
          //   controller: name,
          //   decoration: const InputDecoration(hintText: "enter name"),
          // ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Submit"),
          )
        ],
      ),
    );
  }
}
