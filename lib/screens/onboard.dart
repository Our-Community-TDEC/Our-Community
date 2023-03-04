import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:onboarding/onboarding.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'package:our_community/nuemorphism/colors.dart';

void main() {
  runApp(const OnBoard());
}

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  late int index;
  String selecetedbutton = "";
  var text_style = TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      color: HexColor.WblueText,
      fontFamily: 'poppins');
  WhiteTheme theme = WhiteTheme();
  onboardingPagesList(boxL) {
    return [
      PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
            color: HexColor.Wbackground_color,
            border: Border.all(
              width: 0.0,
              color: HexColor.Wbackground_color,
            ),
          ),
          child: SizedBox(
            height: 745,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Select your role",
                  style: TextStyle(
                      color: HexColor.WblueText,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: boxL - 4,
                      width: boxL - 4,
                      child: NeumorphicButton(
                          style: selecetedbutton == "button1"
                              ? theme.button
                              : theme.unselect_role,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button1";
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Images/role/admin.svg',
                                semanticsLabel: 'My SVG Image',
                              ),
                              Text("Admin", style: text_style),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: boxL - 4,
                      width: boxL - 4,
                      child: NeumorphicButton(
                          style: selecetedbutton == "button2"
                              ? theme.button
                              : theme.unselect_role,
                          onPressed: () {
                            print(selecetedbutton);
                            setState(() {
                              selecetedbutton = "button2";
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Images/role/user.svg',
                                semanticsLabel: 'My SVG Image',
                              ),
                              Text("User", style: text_style),
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: boxL - 4,
                      width: boxL - 4,
                      child: NeumorphicButton(
                          style: selecetedbutton == "button3"
                              ? theme.button
                              : theme.unselect_role,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button3";
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Images/role/doctor.svg',
                                semanticsLabel: 'My SVG Image',
                              ),
                              Text("Doctor", style: text_style),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: boxL - 4,
                      width: boxL - 4,
                      child: NeumorphicButton(
                          style: selecetedbutton == "button4"
                              ? theme.button
                              : theme.unselect_role,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button4";
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Images/role/electrician.svg',
                                semanticsLabel: 'My SVG Image',
                              ),
                              Text("Electrician", style: text_style),
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: boxL - 4,
                      width: boxL - 4,
                      child: NeumorphicButton(
                          style: selecetedbutton == "button5"
                              ? theme.button
                              : theme.unselect_role,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button5";
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Images/role/plumber.svg',
                                semanticsLabel: 'My SVG Image',
                              ),
                              Text("Plumber", style: text_style),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: boxL - 4,
                      width: boxL - 4,
                      child: NeumorphicButton(
                          style: selecetedbutton == "button6"
                              ? theme.button
                              : theme.unselect_role,
                          onPressed: () {
                            setState(() {
                              selecetedbutton = "button6";
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Images/role/cleaner.svg',
                                semanticsLabel: 'My SVG Image',
                              ),
                              Text("Cleaner", style: text_style),
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
            color: background,
            border: Border.all(
              width: 0.0,
              color: background,
            ),
          ),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45.0,
                    vertical: 90.0,
                  ),
                  // child: Image.asset('assets/images/twitter.png',
                  //     color: pageImageColor),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'CHANGE AND RISE',
                      style: pageTitleStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Give others access to any file or folders you choose',
                      style: pageInfoStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      PageModel(
        widget: DecoratedBox(
          decoration: BoxDecoration(
            color: background,
            border: Border.all(
              width: 0.0,
              color: background,
            ),
          ),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 45.0,
                    vertical: 90.0,
                  ),
                  // child: Image.asset('assets/images/instagram.png',
                  //     color: pageImageColor),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'EASY ACCESS',
                      style: pageTitleStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Reach your files anytime from any devices anywhere',
                      style: pageInfoStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }

  static const width = 100.0;
  @override
  void initState() {
    super.initState();
    index = 0;
  }

  SizedBox _skipButton({void Function(int)? setIndex}) {
    return SizedBox(
        width: width,
        child: SizedBox(
          // height: 200,
          // width: 200,
          child: NeumorphicButton(
            style: theme.button,
            onPressed: () {
              if (index == 1) {
                print("setIndex");
                index = 2;
                setIndex!(2);
              } else if (setIndex != null) {
                print(setIndex);
                index = 1;
                setIndex(1);
              }
            },
            child: const Text(
              "Next",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }

  SizedBox get _signupButton {
    return SizedBox(
      width: width,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Material(
          borderRadius: defaultProceedButtonBorderRadius,
          color: defaultProceedButtonColor,
          child: InkWell(
            borderRadius: defaultProceedButtonBorderRadius,
            onTap: () {},
            child: const Padding(
              padding: defaultProceedButtonPadding,
              child: Text(
                'Sign up',
                style: defaultProceedButtonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double minHW = min(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    double boxL = minHW * 0.42;
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: HexColor.Wbackground_color,
        body: Onboarding(
            pages: onboardingPagesList(boxL),
            onPageChange: (int pageIndex) {
              index = pageIndex;
            },
            footerBuilder: (context, dragDistance, pagesLength, setIndex) {
              return DecoratedBox(
                decoration: BoxDecoration(
                    // color: background,
                    // border: Border.all(
                    //   width: 0.0,
                    //   color: HexColor.Wbackground_color,
                    // ),
                    ),
                child: SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ColoredBox(
                      color: HexColor.Wbackground_color,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          index != pagesLength - 1
                              ? _skipButton(setIndex: setIndex)
                              : _signupButton,
                          Padding(
                            padding: const EdgeInsets.only(right: 45.0),
                            child: CustomIndicator(
                              netDragPercent: dragDistance,
                              pagesLength: pagesLength,
                              indicator: Indicator(
                                activeIndicator: ActiveIndicator(
                                    color: HexColor.Whint, borderWidth: 2),
                                closedIndicator: ClosedIndicator(
                                    color: HexColor.WblueText, borderWidth: 2),
                                indicatorDesign: IndicatorDesign.line(
                                  lineDesign: LineDesign(
                                    lineSpacer: 30,
                                    lineType: DesignType.line_nonuniform,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
