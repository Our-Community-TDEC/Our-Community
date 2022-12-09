import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              padding: EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(child: Icon(Icons.arrow_left)),
                  CircleAvatar(child: Icon(Icons.notifications)),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Center(
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    width: 300,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.red,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Aksh Desai"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.pin_drop),
                              Text("103, Banas, Sardar Heights"),
                            ],
                          )
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 75),
                    // padding: EdgeInsets.all(75),
                    child: CircleAvatar(
                      child: Image(
                          image:
                              AssetImage('assets/Images/profile/profile.jpg')),
                      radius: 100,
                    ),
                  )
                ]),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.green,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person),
                                Text("Personal Details"),
                              ],
                            ),
                            CircleAvatar(
                              child: Text(">"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 350,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person),
                                Text("Personal Details"),
                              ],
                            ),
                            CircleAvatar(
                              child: Text(">"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 350,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person),
                                Text("Personal Details"),
                              ],
                            ),
                            CircleAvatar(
                              child: Text(">"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(15)),
          ],
        ),
      ),
    );
  }
}
