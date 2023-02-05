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

  // var pref = await SharedPreferences.getInstance();
  // bool? theme = pref.getBool("Theme");
  // static Color complaint_black = theme == "true" ? fromHex("#000000") : fromHex("#ffffffff");

  void check() async {
    var pref = await SharedPreferences.getInstance();
    bool? theme = pref.getBool("Theme");
    if (theme == "true") {
      print("DARkkkkkk");
      Color complaint_black = fromHex("#000000");
      Color complaint_blue = fromHex("#82B3D9");
      Color blue_button = fromHex("#11A5FA");
      Color blue_button_shadow_blue = fromHex("#9CB4C7");
      Color blue_button_shadow_black = fromHex("#000000");
      Color floating_icon_button = fromHex("#363333");
      Color floating_icon_button_shadow_blue = fromHex("#28A3FF");
      Color floating_icon_button_shadow_black = fromHex("#000000");
    } else {
      print("Lightttt");
    }
  }

  // static Color complaint_black = fromHex("#000000");
  // static Color complaint_black = fromHex("#000000");

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
