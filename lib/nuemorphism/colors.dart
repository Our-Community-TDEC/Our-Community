import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

    static  Color black_shadow = fromHex("#000000");
    static  Color blue_shadow = fromHex("#82B3D9");
    static  Color blue_button = fromHex("#11A5FA");
  static  Color blue_button_shadow_blue = fromHex("#9CB4C7");
    static  Color blue_button_shadow_black = fromHex("#000000");
    static  Color floating_icon_button = fromHex("#363333");
    static  Color floating_icon_button_shadow_blue = fromHex("#28A3FF");
    static  Color floating_icon_button_shadow_black = fromHex("#000000");
    static  Color emergency_button = fromHex("#000000");


  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}