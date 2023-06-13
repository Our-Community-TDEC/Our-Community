import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'dart:math';
import '../../nuemorphism/colors.dart';
import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double pad = 15;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double hw_min = min(height, width) - pad * 2;

    var text_style = TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w600,
        color: HexColor.WblackText,
        fontFamily: 'poppins');

    return Theme(
        data: ThemeData(
          fontFamily: 'poppins',
        ),
        child: Scaffold(
          backgroundColor: HexColor.Wbackground_color,
          body: Container(
            padding: const EdgeInsets.all(pad),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      'assets/Images/Welcome/Welcome_white.png',
                      width: hw_min,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome, To", style: text_style),
                        Text("Our Community", style: text_style),
                        Text(
                          "Let's Get Started",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: HexColor.WblackText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: NeumorphicButton(
                    style: Wbutton,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
