import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:our_community/nuemorphism/colors.dart';

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
