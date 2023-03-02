import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:our_community/nuemorphism/colors.dart';

class AddHome extends StatefulWidget {
  const AddHome({super.key});

  @override
  State<AddHome> createState() => _AddHomeState();
}

class _AddHomeState extends State<AddHome> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'poppins',
      ),
      child: Scaffold(
        backgroundColor: HexColor.profile_container,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicText(
                  "I love flutter",
                  style: NeumorphicStyle(
                    depth: 4, //customize depth here
                    color: HexColor.profile_container,
                    shadowLightColor: HexColor.blue_shadow,
                    shadowDarkColor: HexColor.black_shadow
                  ),
                  textStyle: NeumorphicTextStyle(
                    fontSize: 67, //customize size here
                    // AND others usual text style properties (fontFamily, fontWeight, ...)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
