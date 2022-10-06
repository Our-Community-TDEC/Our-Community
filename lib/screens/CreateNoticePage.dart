import 'package:flutter/material.dart';

class CreateNoticePage extends StatelessWidget {
  const CreateNoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Text('New Notice',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Text('Notice Title'),
          // TextField(),
          Text('Notice Description'),
          // TextField(),
          Row(
            children: [
              Column(
                children: [
                  Text('Time'),
                ],
              ),
              Column(
                children: [
                  Text('Date'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
