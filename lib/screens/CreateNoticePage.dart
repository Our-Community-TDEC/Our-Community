import 'package:final_year_project/screens/NoticeBoard_page.dart';
import 'package:flutter/material.dart';
// import 'o';

class CreateNoticePage extends StatelessWidget {
  const CreateNoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: Colors.grey[800],
      padding: EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black38,
                    child: IconButton(
                      onPressed:()
                      {
                        print('Clicked on list');
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder:(context) => Notice_Board_Page())
                        );
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                      width: 400,
                      child:Container(
                        alignment: Alignment.center,
                        child: Text(
                          "New Notice",
                          // textAlign:TextAlign.center,
                          // textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontFamily: 'Poppins-SemiBold',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 35,
                          ),
                        ),
                      )
                  )
                ],
              )
            ],
          ),
          Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Text('Notice Title',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          // TextField(),
          TextField(
            // obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black38,
              border: OutlineInputBorder(),
              labelText: 'Notice Title',
              hintText: 'Enter Notice Title here',
              hintStyle: TextStyle(
                color: Colors.white),
              labelStyle: TextStyle(
                color: Colors.white
              ),
            ),
          ),
          Text('Notice Description',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          // TextField(),
          TextField(
            // obscureText: true,
            // cursorColor: Colors.black38,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black38,
              border: OutlineInputBorder(),
              labelText: 'Notice Description',
              hintText: 'Enter Notice Description here',
              hintStyle: TextStyle(
                  color: Colors.white),
              labelStyle: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('Time'),
                  // TextField(
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Colors.blue,
                  //     border: OutlineInputBorder(),
                  //     labelText: 'name@example.com',
                  //     hintText: 'Enter E-Mail ID',
                  //   ),
                  // ),
                ],
              ),
              Column(
                children: [
                  Text('Date'),
                ],
              ),
              // TextField(
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     filled: true,
              //     fillColor: Colors.blue,
              //     border: OutlineInputBorder(),
              //     labelText: 'name@example.com',
              //     hintText: 'Enter E-Mail ID',
              //   ),
              // ),
            ],
          ),
          ElevatedButton(
              onPressed: (){},
            child: Text(
            'Submit'
          ),
          ),
        ],
      ),
    ),
    );
  }
}
