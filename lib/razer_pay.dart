import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:our_community/nuemorphism/border_effect.dart';
import 'package:our_community/nuemorphism/colors.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class razer_pay extends StatefulWidget {
  @override
  razer_pay_State createState() => razer_pay_State();
}

class razer_pay_State extends State<razer_pay> {
  late Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();
  bool isDark = false;
  getPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("Theme")) {
      isDark = pref.getBool("Theme")!;
    }
    await getUserDetail();
    themeF(isDark);
  }

  var icon_color = HexColor.WBlackButton;
  var page_title_style;
  var title_style;
  var name_style;
  var desc_text_style;

  themeF(isDark) {
    print("Theme" + isDark.toString());
    if (isDark) {
      desc_text_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: HexColor.text_color,
          fontFamily: 'poppins');

      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.text_color,
      );

      title_style = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: HexColor.text_color,
          fontFamily: 'poppins');

      name_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: HexColor.text_color,
          fontFamily: 'poppins');

      // theme = DarkTheme();
      icon_color = HexColor.icon_color;
    } else {
      desc_text_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: HexColor.WblackText,
          fontFamily: 'poppins');

      //
      icon_color = HexColor.WiconColor;
      page_title_style = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: HexColor.WblueText,
      );

      title_style = TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: HexColor.WblackText,
          fontFamily: 'poppins');

      name_style = TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w300,
          color: HexColor.WblackText,
          fontFamily: 'poppins');
    }
    setState(() {});
  }

  Future<bool> getUserDetail() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();


      final querySnapshot = await FirebaseFirestore.instance
          .collection("user")
          .where("role", isEqualTo: 'admin')
          .where("refferalcode", isEqualTo: snapshot.get("refferalcode"))
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        // Assuming there is only one document that matches the query
        var maintenance = querySnapshot.docs[0].get("maintenance");
        textEditingController.text = maintenance;
      }
      return true;
    } catch (e) {
      // Handle any errors that occur while querying Firestore
      return false;
    }
  }

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
    getPreference();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    // textEditingController.text = "";
    var options = {
      "key": "rzp_test_gHGLmhz0gITxJn",
      "amount": num.parse(textEditingController.text) * 100,
      "name": "Sample App",
      "description": "Payment for the some random product",
      "prefill": {"contact": "2323232323", "email": "shdjsdh@gmail.com"},
    };

    try {
      razorpay.open(options);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        backgroundColor: Colors.blue,
      ));
    }
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.toString()),
      backgroundColor: Colors.blue,
    ));
    // Toast.show("Pament success", context);
  }

  void handlerErrorFailure(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.toString()),
      backgroundColor: Colors.blue,
    ));
    // Toast.show("Pament error", context);
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.toString()),
      backgroundColor: Colors.blue,
    ));
    // Toast.show("External Wallet", context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = isDark ? DarkTheme() : WhiteTheme();
    return Scaffold(
      body: Container(
        decoration: theme.background_color,
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 70, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: NeumorphicButton(
                          onPressed: () => {Navigator.pop(context)},
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: icon_color,
                          ),
                          style: theme.back_button,
                        ),
                      ),
                      Text(
                        "Maintenance",
                        style: page_title_style,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 5,
                  indent: 12,
                  endIndent: 12,
                  color: isDark ? HexColor.text_color : HexColor.WblueText,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Column(
                children: [
                  Neumorphic(
                    style: theme.text_field,
                    child: TextField(
                      style: TextStyle(
                          color: isDark
                              ? HexColor.text_color
                              : HexColor.WblueText),
                      readOnly: true,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: "amount to pay",
                        suffixIcon: Icon(
                          Icons.money,
                          color: icon_color,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        child: ElevatedButton(
                      child: Text(
                        "Pay Maintenance",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        openCheckout();
                      },
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
