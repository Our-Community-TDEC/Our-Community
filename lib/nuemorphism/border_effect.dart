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

  var container = NeumorphicStyle(
    color: HexColor.Wbackground_color,
    depth: 3,
    shape: NeumorphicShape.flat,
    // shadowDarkColor:HexColor.Wdark_container ,
    // shadowLightColor: HexColor.Wlight_container,
    shadowLightColorEmboss: HexColor.Wlight_container,
    shadowDarkColorEmboss: HexColor.Wdark_container,
  );

// -----------------------Chat-----------------------
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
}

// --------------------------Dark Theme------------------------
class DarkTheme {
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
    color: HexColor.blue_button,
    depth: -12,
    intensity: 1,
    // shape: NeumorphicShape.flat,
    shadowLightColorEmboss: HexColor.blue_button_shadow_blue.withOpacity(0.25),
    shadowDarkColorEmboss: HexColor.blue_button_shadow_black.withOpacity(0.25),
  );

  var homepage_button_out = BoxDecoration(
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
}
