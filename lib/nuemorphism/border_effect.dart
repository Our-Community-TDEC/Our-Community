import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../nuemorphism/colors.dart';

var outer_shadow = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  boxShadow: [
    BoxShadow(
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
);

var inner_shadow = NeumorphicStyle(
  color: Colors.grey[800],
  depth: -2,
  shape: NeumorphicShape.flat,
  shadowLightColorEmboss: HexColor.blue_shadow,
  shadowDarkColorEmboss: HexColor.black_shadow,
);

var inner_shadow_button = NeumorphicStyle(
  color: HexColor.blue_button,
  depth: -2,
  shape: NeumorphicShape.flat,
  shadowLightColorEmboss: HexColor.blue_button_shadow_blue.withOpacity(0.25),
  shadowDarkColorEmboss: HexColor.blue_button_shadow_black.withOpacity(0.50),
);

var back_button = NeumorphicStyle(
  color: HexColor.back_button_background,
  // color: HexColor.back_button_background,
  depth: -12,
  shape: NeumorphicShape.flat,
  shadowLightColorEmboss: HexColor.blue_button_shadow_blue.withOpacity(0.25),
  shadowDarkColorEmboss: HexColor.blue_button_shadow_black.withOpacity(0.50),
);

var back_button_container = BoxDecoration(
  color: HexColor.back_button_background,
  borderRadius: BorderRadius.circular(100),
  boxShadow: [
    BoxShadow(
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
);

var blue_button_in_shadow = NeumorphicStyle(
  color: HexColor.blue_button,
  depth: -12,
  intensity: 12,
  shape: NeumorphicShape.flat,
  shadowLightColorEmboss: HexColor.blue_button_shadow_blue.withOpacity(0.25),
  shadowDarkColorEmboss: HexColor.blue_button_shadow_black.withOpacity(0.60),
);

var blue_button_out_shadow = BoxDecoration(
  borderRadius: new BorderRadius.all(Radius.circular(44)),
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
      offset: Offset(-6, -2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ],
);

var emergency_blue_button_out_shadow = BoxDecoration(
  borderRadius: new BorderRadius.all(Radius.circular(44)),
  boxShadow: [
    BoxShadow(
      // color: HexColor.complaint_black.withOpacity(0.40),
      color: HexColor.black_shadow.withOpacity(0.20),
      offset: Offset(8, 8),
      blurRadius: 16,
      spreadRadius: 1,
    ),
    BoxShadow(
      color: HexColor.blue_shadow.withOpacity(0.60),
      offset: Offset(-8, -8),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ],
);

var emergency_blue_button_in_shadow = NeumorphicStyle(
  color: HexColor.blue_button,
  depth: -12,
  intensity: 1,
  // shape: NeumorphicShape.flat,
  shadowLightColorEmboss: HexColor.blue_button_shadow_blue.withOpacity(0.25),
  shadowDarkColorEmboss: HexColor.blue_button_shadow_black.withOpacity(0.25),
);

var show_data_compl_sugge = NeumorphicStyle(
  color: HexColor.back_color_comp_suggestion,
  depth: -2,
  shape: NeumorphicShape.flat,
  shadowLightColorEmboss: HexColor.blue_shadow,
  shadowDarkColorEmboss: HexColor.black_shadow,
);

// White Theme
var Wbutton = NeumorphicStyle(
  color: HexColor.Wbackground_color,
  depth: 9,
  // intensity: 0.5,
  surfaceIntensity: 1,
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(44)),
  shape: NeumorphicShape.flat,
  shadowLightColorEmboss: HexColor.WLightButton,
  shadowDarkColorEmboss: HexColor.WBlackButton,
);

var Wtext_field = NeumorphicStyle(
  color: HexColor.Wbackground_color,
  depth: -2,
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(44)),
  shape: NeumorphicShape.flat,
  shadowLightColorEmboss: HexColor.WtextfieldLightShadow,
  shadowDarkColorEmboss: HexColor.WtextfieldDarkShadow,
);

// --------------------------White Theme------------------------
class WhiteTheme {
  var button = NeumorphicStyle(
    color: HexColor.Wbackground_color,
    depth: 9,
    // intensity: 0.5,
    surfaceIntensity: 1,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(44)),
    shape: NeumorphicShape.flat,
    shadowLightColorEmboss: HexColor.WLightButton,
    shadowDarkColorEmboss: HexColor.WBlackButton,
  );

  var homepage_button = NeumorphicStyle(
    color: HexColor.Wbackground_color,
    depth: -10,
    intensity: 1,
    // shape: NeumorphicShape.flat,
    shadowLightColorEmboss: HexColor.WLightButton.withOpacity(0.50),
    shadowDarkColorEmboss: HexColor.WBlackButton,
  );

  var homepage_button_out = BoxDecoration(
    borderRadius: new BorderRadius.all(Radius.circular(44)),
    boxShadow: [
      BoxShadow(
        // color: HexColor.complaint_black.withOpacity(0.40),
        color: HexColor.WBlackButton,
        offset: Offset(8, 8),
        blurRadius: 16,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: HexColor.WLightButton.withOpacity(0.40),
        offset: Offset(-8, -8),
        blurRadius: 16,
        spreadRadius: 0,
      ),
    ],
  );

// ---------------------------Complaints------------------------
  var complaint_neumorphism = NeumorphicStyle(
    color: HexColor.Wbackground_color,
    depth: -4,
    shape: NeumorphicShape.flat,
    shadowLightColorEmboss: HexColor.WtextfieldLightShadow,
    shadowDarkColorEmboss: HexColor.WtextfieldDarkShadow,
  );

  var com_sugg_textfield_decoration = InputDecoration(
      hintText: "Complaint title",
      filled: true,
      hintStyle: TextStyle(color: HexColor.WblackText),
      fillColor: HexColor.Wbackground_color,
      border: OutlineInputBorder(borderSide: BorderSide.none));

  var com_sugg_textfield_textstyle  = TextStyle(color: HexColor.WblueText);

  var com_sugg_textfield_desc_decoration = InputDecoration(
    hintText: "Enter Your Concern Here!!!",
    filled: true,
    hintStyle: TextStyle(color: HexColor.WblackText),
    fillColor: HexColor.Wbackground_color,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    ),
  );

  var com_sugge_out_shadow = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: HexColor.Wlight_container,
        offset: Offset(3, 3),
        blurRadius: 2,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: HexColor.Wdark_container,
        offset: Offset(-3, -2),
        blurRadius: 4,
        spreadRadius: 0,
      ),
    ],
  );

  var com_sugge_in_shadow = NeumorphicStyle(
    color: HexColor.Wbackground_color,
    depth: -2,
    shape: NeumorphicShape.flat,
    shadowLightColorEmboss: HexColor.Wdark_container,
    shadowDarkColorEmboss: HexColor.Wlight_container,
  );

  var com_sugge_container = NeumorphicStyle(
    color: HexColor.Wbackground_color,
    depth: 3,
    shape: NeumorphicShape.flat,
    // shadowDarkColor:HexColor.Wdark_container ,
    // shadowLightColor: HexColor.Wlight_container,
    shadowLightColorEmboss: HexColor.Wlight_container,
    shadowDarkColorEmboss: HexColor.Wdark_container,
  );

// -----------------------Chat-----------------------
  var chat_textbox = NeumorphicStyle(
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),
      shadowDarkColorEmboss: HexColor.WtextfieldDarkShadow,
      shadowLightColorEmboss: HexColor.WtextfieldLightShadow,
      depth: -2,
      color: HexColor.Wbackground_color);

  var chat_user_neuorphic = NeumorphicStyle(
    depth: 5,
    shadowLightColor: HexColor.WchatLight,
    shadowDarkColor: HexColor.WchatDark,
    color: HexColor.Wbackground_color,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
      topRight: Radius.circular(400),
      topLeft: Radius.circular(400),
      bottomLeft: Radius.circular(400),
    )),
  );

  var chat_opposite_user = NeumorphicStyle(
    depth: -2,
    shadowLightColorEmboss: HexColor.WchatLight,
    shadowDarkColorEmboss: HexColor.WchatDark,
    color: HexColor.Wbackground_color,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
      topRight: Radius.circular(400),
      topLeft: Radius.circular(400),
      bottomRight: Radius.circular(400),
    )),
  );

  // -----------------Role----------------
  var unselect_role = NeumorphicStyle(
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(44)),
    color: HexColor.Wbackground_color,
    depth: -10,
    intensity: 1,
    // shape: NeumorphicShape.flat,
    shadowLightColorEmboss: HexColor.WLightButton.withOpacity(0.50),
    shadowDarkColorEmboss: HexColor.WBlackButton,
  );
  var selected_role = NeumorphicStyle(
    color: HexColor.Wbackground_color,
    depth: 10,
    // intensity: 1,
    // shape: NeumorphicShape.flat,
    shadowLightColor: HexColor.WLightButton,
    shadowDarkColor: HexColor.WBlackButton,
  );

  var appbar = NeumorphicAppBar(
    title: Text(
      "Home Page",
      style: TextStyle(color: HexColor.WblueText),
    ),
    padding: 10,
    centerTitle: true,
    color: HexColor.Wbackground_color,
    textStyle:
        TextStyle(color: HexColor.WblueText, fontWeight: FontWeight.w700),
    buttonStyle: NeumorphicStyle(
      color: HexColor.Wbackground_color,
      boxShape: NeumorphicBoxShape.circle(),
      shadowLightColor: HexColor.backButtonLight,
      shadowDarkColor: HexColor.backButtonDark,
      depth: 5,
    ),
    iconTheme: IconThemeData(color: HexColor.WblueText),
  );

  var background_color = BoxDecoration(color: HexColor.Wbackground_color);

  var chatAppBar = NeumorphicAppBar(
    title: Text(
      "Chat",
      style: TextStyle(color: HexColor.WblueText),
    ),
    centerTitle: true,
    padding: 10,
    color: HexColor.Wbackground_color,
    textStyle:
        TextStyle(color: HexColor.WblueText, fontWeight: FontWeight.w700),
    // buttonStyle: NeumorphicStyle(
    //   color: HexColor.Wbackground_color,
    //   boxShape: NeumorphicBoxShape.circle(),
    //   shadowLightColor: HexColor.backButtonLight,
    //   shadowDarkColor: HexColor.backButtonDark,
    //   depth: 5,
    // ),
  );

  // -----------------------Profile Page------------------------
  var container_style = NeumorphicStyle(
    color: HexColor.Wbackground_color,
    depth: 9,
    // intensity: 0.5,
    surfaceIntensity: 1,
    shape: NeumorphicShape.flat,
    shadowLightColorEmboss: HexColor.WLightButton,
    shadowDarkColorEmboss: HexColor.WBlackButton,
  );

  var circle_container_style = NeumorphicStyle(
    color: HexColor.Wbackground_color,
    depth: 9,
    // intensity: 0.5,
    surfaceIntensity: 1,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
    shape: NeumorphicShape.flat,
    shadowLightColorEmboss: HexColor.WLightButton,
    shadowDarkColorEmboss: HexColor.WBlackButton,
  );

  var back_button = NeumorphicStyle(
      color: HexColor.Wbackground_color,
      boxShape: NeumorphicBoxShape.circle(),
      shadowLightColor: HexColor.Wlight_vote,
      shadowDarkColor: HexColor.Wdark_vote,
      depth: 4);
}

// --------------------------Dark Theme------------------------
class DarkTheme {
  var appbar = NeumorphicAppBar(
    title: Text(
      "Home Page",
      style: TextStyle(color: HexColor.text_color),
    ),
    padding: 10,
    centerTitle: true,
    color: HexColor.background_top,
    textStyle:
        TextStyle(color: HexColor.WblueText, fontWeight: FontWeight.w700),
    buttonStyle: NeumorphicStyle(
      color: HexColor.back_button_background,
      boxShape: NeumorphicBoxShape.circle(),
      shadowLightColor: HexColor.back_button_lightshadow.withOpacity(0.50),
      shadowDarkColor: HexColor.black_shadow,
      depth: 5,
    ),
    iconTheme: IconThemeData(color: HexColor.blue_icon),
  );

  var button = NeumorphicStyle(
    color: HexColor.background_top,
    depth: 5,
    // intensity: 0.5,
    surfaceIntensity: 1,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(44)),
    shape: NeumorphicShape.flat,
    shadowLightColor: HexColor.blue_shadow,
    shadowDarkColor: HexColor.black_shadow,
  );

  var background_color = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [HexColor.background_top, HexColor.background_end]));

  var homepage_button = NeumorphicStyle(
    color: HexColor.background_top,
    depth: -5,
    intensity: 1,
    // shape: NeumorphicShape.flat,
    shadowLightColorEmboss: HexColor.blue_shadow.withOpacity(0.50),
    shadowDarkColorEmboss: HexColor.black_shadow.withOpacity(0.75),
  );

  var homepage_button_out = BoxDecoration(
    borderRadius: new BorderRadius.all(Radius.circular(44)),
    boxShadow: [
      BoxShadow(
        color: HexColor.black_shadow,
        offset: Offset(8, 8),
        blurRadius: 10,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: HexColor.blue_shadow.withOpacity(0.25),
        offset: Offset(-8, -8),
        blurRadius: 10,
        spreadRadius: 0,
      ),
    ],
  );

// ---------------------------Complaints------------------------
  var complaint_neumorphism = NeumorphicStyle(
    color: HexColor.background_top,
    depth: -4,
    shape: NeumorphicShape.flat,
    shadowLightColorEmboss: HexColor.blue_shadow,
    shadowDarkColorEmboss: HexColor.black_shadow,
  );

  var com_sugg_textfield_decoration = InputDecoration(
      hintText: "Complaint title",
      filled: true,
      hintStyle: TextStyle(color: HexColor.text_color),
      fillColor: HexColor.background_top,
      border: OutlineInputBorder(borderSide: BorderSide.none));

  var com_sugg_textfield_textstyle = TextStyle(color: HexColor.text_color);

  var com_sugg_textfield_desc_decoration = InputDecoration(
    hintText: "Enter Your Concern Here!!!",
    filled: true,
    hintStyle: TextStyle(color: HexColor.text_color),
    fillColor: HexColor.background_top,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    ),
  );

  var com_sugge_out_shadow = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: HexColor.black_shadow,
        offset: Offset(3, 3),
        blurRadius: 2,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: HexColor.blue_shadow.withOpacity(0.50),
        offset: Offset(-3, -2),
        blurRadius: 4,
        spreadRadius: 0,
      ),
    ],
  );

  var com_sugge_in_shadow = NeumorphicStyle(
    color: HexColor.Wbackground_color,
    depth: -2,
    shape: NeumorphicShape.flat,
    shadowLightColorEmboss: HexColor.Wdark_container,
    shadowDarkColorEmboss: HexColor.Wlight_container,
  );

  var com_sugge_container = NeumorphicStyle(
    color: HexColor.background_top,
    depth: -2,
    shape: NeumorphicShape.flat,
    shadowLightColorEmboss: HexColor.blue_shadow,
    shadowDarkColorEmboss: HexColor.black_shadow,
  );

// -----------------------Chat-----------------------

  var chat_textbox = NeumorphicStyle(
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40)),
    shadowDarkColorEmboss: HexColor.black_shadow.withOpacity(0.75),
    shadowLightColorEmboss: HexColor.blue_shadow.withOpacity(0.75),
    depth: -2,
    color: HexColor.profile_container,
  );

  var chat_user_neuorphic = NeumorphicStyle(
    depth: 5,
    shadowLightColor: HexColor.blue_shadow.withOpacity(0.80),
    shadowDarkColor: HexColor.black_shadow,
    color: HexColor.background_top,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
      topRight: Radius.circular(400),
      topLeft: Radius.circular(400),
      bottomLeft: Radius.circular(400),
    )),
  );

  var chat_opposite_user = NeumorphicStyle(
    depth: -2,
    shadowLightColorEmboss: HexColor.blue_shadow.withOpacity(0.80),
    shadowDarkColorEmboss: HexColor.black_shadow,
    color: HexColor.background_top,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
      topRight: Radius.circular(400),
      topLeft: Radius.circular(400),
      bottomRight: Radius.circular(400),
    )),
  );

  var chatAppBar = NeumorphicAppBar(
    title: Text(
      "Chat",
      style: TextStyle(color: HexColor.text_color),
    ),
    centerTitle: true,
    padding: 10,
    color: HexColor.background_top,
    textStyle:
        TextStyle(color: HexColor.text_color, fontWeight: FontWeight.w700),
    // buttonStyle: NeumorphicStyle(
    //   color: HexColor.Wbackground_color,
    //   boxShape: NeumorphicBoxShape.circle(),
    //   shadowLightColor: HexColor.backButtonLight,
    //   shadowDarkColor: HexColor.backButtonDark,
    //   depth: 5,
    // ),
  );
  // -----------------Role----------------
  var unselect_role = NeumorphicStyle(
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(44)),
    color: HexColor.Wbackground_color,
    depth: -10,
    intensity: 1,
    // shape: NeumorphicShape.flat,
    shadowLightColorEmboss: HexColor.WLightButton.withOpacity(0.50),
    shadowDarkColorEmboss: HexColor.WBlackButton,
  );
  var selected_role = NeumorphicStyle(
    color: HexColor.Wbackground_color,
    depth: 10,
    // intensity: 1,
    // shape: NeumorphicShape.flat,
    shadowLightColor: HexColor.WLightButton,
    shadowDarkColor: HexColor.WBlackButton,
  );

  // -----------------------Profile Page------------------------
  var container_style = NeumorphicStyle(
    color: HexColor.profile_container,
    shadowDarkColor: HexColor.black_shadow,
    shadowLightColor: HexColor.blue_shadow.withOpacity(0.75),
    depth: 5,
  );

  var circle_container_style = NeumorphicStyle(
    boxShape: NeumorphicBoxShape.roundRect(
      BorderRadius.circular(100),
    ),
    color: HexColor.profile_container,
    shadowDarkColor: HexColor.black_shadow,
    shadowLightColor: HexColor.blue_shadow.withOpacity(0.75),
  );

  var back_button = NeumorphicStyle(
    color: HexColor.background_top,
    boxShape: NeumorphicBoxShape.circle(),
    shadowLightColor: HexColor.blue_shadow,
    shadowDarkColor: HexColor.black_shadow,
    depth: 4,
  );
}
