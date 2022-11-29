import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class razer_pay extends StatefulWidget {
  const razer_pay({Key? key}) : super(key: key);
  @override
  razer_pay_State createState() => razer_pay_State();
}

class razer_pay_State extends State<razer_pay> {
  var _razorpay = Razorpay();
  TextEditingController pay_amount = TextEditingController();

  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Payment Successfully done"),
      backgroundColor: Colors.blue,
    ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Payment not Successfully done"),
      backgroundColor: Colors.blue,
    ));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Payment Successfully done"),
      backgroundColor: Colors.blue,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        TextField(
          // controller: pay_amount,
          decoration: InputDecoration(hintText: "Enter Your Amount"),
        ),
        ElevatedButton(
            onPressed: () {
              var options = {
                'key': 'rzp_test_VFhcRHJ3J2DDsw',
                'amount': (int.parse(pay_amount.text)*100).toString(), //in the smallest currency sub-unit.
                'name': 'Darshan',
                'description': 'Demo',
                'timeout': 300, // in seconds
                'prefill': {
                  'contact': '9099366492',
                  'email': 'zdken999.zd@gmail.com'
                }
              };
              _razorpay.open(options);
            },
            child: Text("Pay Maintenance"))
      ]),
    );
  }

  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }
}
