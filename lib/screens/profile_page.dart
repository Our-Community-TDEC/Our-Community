import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:googleapis/dfareporting/v3_5.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../nuemorphism/profile_neumor.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var theme;
  var back_color = HexColor.WBlackButton;
  var icon_color=HexColor.WBlackButton;
  var name_title_style;
  var address_style;
  var text_list_style;
  bool isDark = false;
  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (isDark) {
      back_color = HexColor.background_top;
      icon_color = HexColor.icon_color;
      theme = DarkTheme();
      name_title_style = TextStyle(fontSize: 25, color: HexColor.text_color);
      address_style = TextStyle(fontSize: 20, color: HexColor.text_color);
      text_list_style = TextStyle(color: HexColor.text_color, fontSize: 20);
    } else {
      theme = WhiteTheme();
      back_color = HexColor.Wbackground_color;
      icon_color = HexColor.WiconColor;
      name_title_style = TextStyle(fontSize: 25, color: HexColor.WblueText);
      address_style = TextStyle(fontSize: 20, color: HexColor.WblueText);
      text_list_style = TextStyle(color: HexColor.WblueText, fontSize: 20);
    }
    setState(() {});
  }

  getPreference() async {
    var pref = await SharedPreferences.getInstance();
    isDark = pref.getBool("Theme")!;
    print("object" + isDark.toString());
    themeF(isDark);
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    getPreference();
    // getTheme();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var margin = width / 15.77;
    var padding = width / 15.77;
    print(width / 1.40);

    return Theme(
      data: ThemeData(fontFamily: 'poppins'),
      child: Scaffold(
        // floatingActionButton: Stack(
        //   children: [
        //     Positioned(
        //       top: 30,
        //       left: 30,
        //       child: NeumorphicButton(
        //         onPressed: () => {Navigator.pop(context)},
        //         child: Icon(
        //           Icons.arrow_back_ios,
        //           color: icon_color,
        //         ),
        //         style: theme.back_button
        //       ),
        //     ),
        //     Positioned(
        //       top: 30,
        //       right: 10,
        //       child: NeumorphicButton(
        //         onPressed: () => {Navigator.pop(context)},
        //         child: Icon(
        //           Icons.notification_add_outlined,
        //           color: icon_color,
        //         ),
        //         style: theme.back_button
        //       ),
        //     ),
        //   ],
        // ),
        body: Container(
          decoration: theme.background_color,
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
                            child: Neumorphic(
                              style: theme.container_style,
                            ),
                          ),
                        ),
                        // Circle
                        Positioned(
                          left: width / 2.5 - 75,
                          child: SizedBox(
                            width: width / 2.28,
                            height: width / 2.28,
                            child: Neumorphic(
                              style: theme.circle_container_style,
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
                                      style: name_title_style,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          size: 25,
                                          color: icon_color,
                                        ),
                                        Text(
                                          "243, Ayodhya",
                                          style: address_style,
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
                    style: theme.container_style,
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
                                    color: icon_color,
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
                                color: icon_color,
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
                                    color:icon_color,
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
                                color:icon_color,
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
                                    color:icon_color,
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
                                color:icon_color,
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
                                    color:icon_color,
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
                                color:icon_color,
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
                                    color:icon_color,
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
                                color:icon_color,
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
                                    color:icon_color,
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
                                color:icon_color,
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
