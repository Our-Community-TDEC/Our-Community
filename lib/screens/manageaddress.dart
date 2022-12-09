import 'package:flutter/material.dart';
class ManageAddress extends StatelessWidget {
  // const ManageAddress({Key? key}) : super(key: key);
  Color gradient_top = Color(0xFF2E2F36);
  Color gradient_bot = Color(0xE02E2F36);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [gradient_top, gradient_bot],
    ),
    ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Text("manageadress",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
    ),
        ),
    ),
    ]
    ),
    );
  }
}
