import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:our_community/screens/Complain%20Pages/OtherComplains.dart';
import 'package:our_community/logic/complain_logic.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../nuemorphism/colors.dart';
import '../../nuemorphism/border_effect.dart';
// import 'package:our_community/screens/Complain Pages/OtherComplains.dart';

class ComplainPage extends StatefulWidget with Complain_Logic {
  @override
  State<ComplainPage> createState() => _ComplainPageState();
}

class _ComplainPageState extends State<ComplainPage> {
  var icon_color;
  var text_style;
  bool isDark = false;
  var page_title_style;
  getPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("Theme")) {
      isDark = pref.getBool("Theme")!;
    }
    setState(() {
      themeF(isDark);
    });
  }

  themeF(isDark) {
    if (isDark) {
      text_style = TextStyle(
        fontSize: 26,
        color: HexColor.text_color,
        fontWeight: FontWeight.w500,
      );
      icon_color = HexColor.icon_color;
      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.text_color,
      );
    } else {
      icon_color = HexColor.WiconColor;
      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.WblueText,
      );
      text_style = TextStyle(
        fontSize: 26,
        color: HexColor.WblackText,
        fontWeight: FontWeight.w500,
      );
    }
  }

  @override
  initState() {
    super.initState();
    getPreference();
  }

  @override
  Widget build(BuildContext context) {
    final theme = isDark ? DarkTheme() : WhiteTheme();
    double fullheight = MediaQuery.of(context).size.height;
    double fullwidth = MediaQuery.of(context).size.width;
    String datetime = (DateFormat.Md('en_US').add_jm().format(DateTime.now()));

    return Theme(
      data: ThemeData(
        fontFamily: 'poppins',
      ),
      child: Scaffold(
        floatingActionButton: SizedBox(
          height: 45,
          width: 45,
          child: FittedBox(
            child: NeumorphicFloatingActionButton(
              onPressed: () => {Navigator.pop(context)},
              child: Icon(
                Icons.arrow_back,
                color: icon_color,
              ),
              style: theme.back_button,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Container(
          decoration: theme.background_color,
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 25, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(fullwidth / 4, 0, 0, 0),
                          child: Text(
                            "Complaint",
                            style: page_title_style,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      thickness: 5,
                      indent: 12,
                      endIndent: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 370,
                height: fullheight - 112,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 72,
                      decoration: theme.com_sugge_out_shadow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 68,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: NeumorphicButton(
                                style: theme.com_sugge_in_shadow,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtherComplains(
                                            "Parking Issue",
                                            "I'm having a parking issue at <enter location>.\nPlease try and have it fixed.")),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.local_parking,
                                        size: 40, color: icon_color),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        "Parking Issue",
                                        style: text_style,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 72,
                      decoration: theme.com_sugge_out_shadow,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 68,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: NeumorphicButton(
                                  style: theme.com_sugge_in_shadow,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OtherComplains(
                                              "Street Light Issue",
                                              "The street light on <enter location> is not working as intended.\nPlease try and have it fixed.")),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.lightbulb,
                                          size: 40, color: icon_color),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        child: Text(
                                          "Street light Issue",
                                          style: text_style,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    Container(
                      height: 72,
                      decoration: theme.com_sugge_out_shadow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 68,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: NeumorphicButton(
                                style: theme.com_sugge_in_shadow,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtherComplains(
                                            "Water Issue",
                                            "I live in <enter house number> and am having an water related issue.\nPlease send a plumber.")),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.water_drop,
                                        size: 40, color: icon_color),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        "Water Issue",
                                        style: text_style,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 72,
                      decoration: theme.com_sugge_out_shadow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 68,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: NeumorphicButton(
                                style: theme.com_sugge_in_shadow,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtherComplains(
                                            "Gaspipline issue",
                                            "I live at <enter house number> and am having an issue with the gas pipeline.\nPlease send someone to fix it.")),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.gas_meter,
                                        size: 40, color: icon_color),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        "Gaspipeline Issue",
                                        style: text_style,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 72,
                      decoration: theme.com_sugge_out_shadow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 68,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: NeumorphicButton(
                                style: theme.com_sugge_in_shadow,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtherComplains(
                                            "Drainage Issue",
                                            "I noticed a drainage issue at <enter location>.\n<Describe the issue>\nPlease try and have it fixed.")),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.drag_indicator,
                                        size: 40, color: icon_color),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        "Drainage Issue",
                                        style: text_style,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 72,
                      decoration: theme.com_sugge_out_shadow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 68,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: NeumorphicButton(
                                style: theme.com_sugge_in_shadow,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtherComplains(
                                            "Electricity Issue",
                                            "I'm having an electricity relaed issue at my home,  <enter house number>.\nPlease try and have it fixed.")),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.electric_bolt,
                                        size: 40, color: icon_color),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        "Electricity Issue",
                                        style: text_style,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 72,
                      decoration: theme.com_sugge_out_shadow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 68,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: NeumorphicButton(
                                style: theme.com_sugge_in_shadow,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtherComplains(
                                            "Road Issue",
                                            "I've noticed an road related issue at <enter location>.\nPlease try and have it fixed.")),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.add_road,
                                        size: 40, color: icon_color),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        "Road Issue",
                                        style: text_style,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 72,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(44.0),
                          topLeft: Radius.circular(44.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            // color: HexColor.complaint_black.withOpacity(0.40),
                            color: HexColor.black_shadow.withOpacity(0.40),
                            offset: Offset(3, 3),
                            blurRadius: 2,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: HexColor.blue_shadow.withOpacity(0.25),
                            offset: Offset(-3, -2),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 68,
                            child: ClipRRect(
                              borderRadius: new BorderRadius.only(
                                  topLeft: Radius.circular(44),
                                  bottomRight: Radius.circular(44)),
                              child: NeumorphicButton(
                                style: NeumorphicStyle(
                                  color: HexColor.blue_button,
                                  depth: -12,
                                  intensity: 12,
                                  shape: NeumorphicShape.flat,
                                  shadowLightColorEmboss: HexColor
                                      .blue_button_shadow_blue
                                      .withOpacity(0.25),
                                  shadowDarkColorEmboss: HexColor
                                      .blue_button_shadow_black
                                      .withOpacity(0.50),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          OtherComplains("", ""),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.emoji_emotions,
                                        size: 40, color: isDark ? Colors.white : Colors.black),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        "Other Complaint",
                                        style: text_style,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                   
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
