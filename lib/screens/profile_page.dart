import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:our_community/nuemorphism/colors.dart';

import '../nuemorphism/profile_neumor.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var margin = width / 15.77;
    var padding = width / 15.77;
    var text_list_style =
        TextStyle(color: HexColor.profile_list_text, fontSize: 20);
    print(width / 1.40);

    return Theme(
      data: ThemeData(fontFamily: 'poppins'),
      child: Scaffold(
        floatingActionButton: Stack(
          children: [
            Positioned(
              top: 30,
              left: 30,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: HexColor.background_top,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: 10,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: HexColor.background_top,
                child: const Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [HexColor.background_top, HexColor.background_end],
            // ),
            color: HexColor.profile_container,
          ),
          child: Container(
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width,
                    height: width / 1.40,
                    child: Stack(
                      children: [
                        // Rectangle
                        Positioned(
                          // top: 0,
                          top: (width / 2) / 2,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: SizedBox(
                            width: width,
                            height: width / 2,
                            child: Neumorphic(style: container_style),
                          ),
                        ),
                        // Circle
                        Positioned(
                          left: width / 2.5 - 75,
                          child: SizedBox(
                            width: width / 2.28,
                            height: width / 2.28,
                            child: Neumorphic(
                              style: circle_container_style,
                            ),
                          ),
                        ),
                        // Upper circle
                        Positioned(
                          top: 5,
                          left: width / 2.5 - 70,
                          child: SizedBox(
                            width: (width / 2.28) - 10,
                            height: (width / 2.28) - 10,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(width)),
                              child: Image(
                                image: NetworkImage(
                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                              ),
                            ),
                          ),
                        ),
                        // Showing ussr name
                        Positioned(
                          bottom: 20,
                          width: width / 1.223,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Bhuva Darshan",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          size: 25,
                                          color: HexColor.blue_button,
                                        ),
                                        Text(
                                          "243, Ayodhya",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Neumorphic(
                    style: container_style,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: HexColor.blue_button,
                                    size: 36,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: Text(
                                      "Personal Details",
                                      style: text_list_style,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: HexColor.blue_button,
                                size: 36,
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: HexColor.blue_button,
                                    size: 36,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: Text(
                                      "Emergency Contacts",
                                      style: text_list_style,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: HexColor.blue_button,
                                size: 36,
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: HexColor.blue_button,
                                    size: 36,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: Text(
                                      "Homes",
                                      style: text_list_style,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: HexColor.blue_button,
                                size: 36,
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: HexColor.blue_button,
                                    size: 36,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: Text(
                                      "Bank Details",
                                      style: text_list_style,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: HexColor.blue_button,
                                size: 36,
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: HexColor.blue_button,
                                    size: 36,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: Text(
                                      "Notification",
                                      style: text_list_style,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: HexColor.blue_button,
                                size: 36,
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_2_outlined,
                                    color: HexColor.blue_button,
                                    size: 36,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: Text(
                                      "Tell Your Friend",
                                      style: text_list_style,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: HexColor.blue_button,
                                size: 36,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
