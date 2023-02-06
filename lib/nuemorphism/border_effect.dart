import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../nuemorphism/colors.dart';


  var outer_shadow = BoxDecoration(
    borderRadius: BorderRadius.circular(16),
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




