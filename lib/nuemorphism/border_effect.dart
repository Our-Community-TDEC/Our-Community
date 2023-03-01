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
  // var button = NeumorphicStyle(
  //   color: HexColor.Wbackground_color,
  //   depth: 2,
  //   intensity:0.86,
  //   boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(44)), 
  //   shape: NeumorphicShape.flat,
  //   shadowLightColorEmboss: HexColor.WLightButton,
  //   shadowDarkColorEmboss: HexColor.WBlackButton,
  // );