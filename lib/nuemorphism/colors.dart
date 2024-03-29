import 'package:flutter/material.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

    static  Color black_shadow = fromHex("#000000");
    static  Color text_color = fromHex("#FFFFFF");
    static  Color blue_shadow = fromHex("#82B3D9");
    static  Color blue_button = fromHex("#11A5FA");
    static  Color blue_icon = fromHex("#11A5FA");
    static  Color back_color_comp_suggestion = fromHex("#47484E");
    static  Color blue_button_shadow_blue = fromHex("#9CB4C7");
    static  Color blue_button_shadow_black = fromHex("#000000");
    static  Color floating_icon_button = fromHex("#363333");
    static  Color floating_icon_button_shadow_blue = fromHex("#28A3FF");
    static  Color floating_icon_button_shadow_black = fromHex("#000000");
    static  Color back_button_background = fromHex("#363333");
    static  Color back_button_lightshadow = fromHex("#4C8BBA");
    static  Color background_top = fromHex("#2E2F36");
    static  Color Dbackground_center = fromHex("#363333");
    static  Color background_end = fromHex("#0D0E10");
    static  Color icon_color = fromHex("#11A5FA");


    // Profile
    static  Color profile_container = fromHex("#35373B");
    static  Color profile_list_text = fromHex("#9FCAE2");

    

    
    // ------------------------WHITE THEME----------------------

    //Background Color
    static  Color Wbackground_color = fromHex("#D8E7FF");

    // TextField Color
    static  Color WtextfieldDarkShadow = fromHex("#A3C0EC");
    static  Color WtextfieldLightShadow = fromHex("#FFFFFF");
    static  Color Whint = fromHex("#6C6565");

    // icon Color
    static  Color WiconColor = fromHex("#5495F8");


    // Text Color
    static  Color WblackText = fromHex("#000000");
    static  Color WblueText = fromHex("#111111");



  // Button
    static  Color WBlackButton = fromHex("#C6D8F1");
    static  Color WLightButton = fromHex("#FFFFFF");

    // BackButton
    static  Color backButtonLight = fromHex("#FFFFFF");
    static  Color backButtonDark = fromHex("#6789A4");

    // Chat
    static  Color WchatLight = fromHex("#FFFFFF");
    static  Color WchatDark = fromHex("#C6D9F5");
    
    // Comlaint Suggestions
    static  Color Wlight_container = fromHex("#B0C1DB");
    static  Color Wdark_container = fromHex("#FFFFFF");

    static  Color Wlight_vote = fromHex("#FFFFFF");
    static  Color Wdark_vote = fromHex("#72A4EE");


    //Drawer Color
    static  Color Wdrawer = fromHex("#82B3D9");

    // Navigation bar
    static  Color Wcurrent_icon_color = fromHex("#2735FF");
    static  Color Wnavigation_bar_color = fromHex("#B2D1FF");

    // Noticeboard color
    // noticeboaard
    // color
    // aya 
    // avshe

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension WhiteHexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

    
     
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
