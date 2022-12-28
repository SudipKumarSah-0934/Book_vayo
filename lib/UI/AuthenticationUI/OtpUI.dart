import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpUI extends StatefulWidget {
  const OtpUI({Key? key}) : super(key: key);

  @override
  _OtpUIState createState() => _OtpUIState();
}

class _OtpUIState extends State<OtpUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaede8),
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
              height: 25,
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {},
            child: const Text(
              "Skip",
              style: TextStyle(
                  color: Color.fromARGB(255, 250, 90, 30),
                  decoration: TextDecoration.underline),
            ),
            shape:
                const CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Enter your OTP',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            'A OTP code has been sent to your phone.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          OtpPinField(
            otpPinFieldInputType: OtpPinFieldInputType.none,
            // otpPinInputCustom: "\$",
            onSubmit: (text) {},
            otpPinFieldStyle: const OtpPinFieldStyle(
              defaultFieldBorderColor: Colors.orange,
              activeFieldBorderColor: Colors.white,
              defaultFieldBackgroundColor: Colors.white,
              activeFieldBackgroundColor: Colors.white,
            ),
            highlightBorder: true,
            fieldWidth: 50,
            fieldHeight: 50,
            maxLength: 4,
            keyboardType: TextInputType.number,
            autoFocus: false,
            otpPinFieldDecoration:
                OtpPinFieldDecoration.defaultPinBoxDecoration,
          ),
          const SizedBox(
            height: 20,
          ),
          Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 18.0,
            color: const Color(0xFFF37440),
            // clipBehavior: Clip.antiAlias,
            child: MaterialButton(
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
                // color: Colors.orange,
                minWidth: MediaQuery.of(context).size.width * 0.7,
                onPressed: () {
                  Navigator.of(context).pushNamed('/accountInfoUI');
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 18.0,
            color: const Color(0xFFF37440),
            // clipBehavior: Clip.antiAlias,
            child: MaterialButton(
                child: const Text(
                  "Resend Now",
                  style: TextStyle(color: Colors.white),
                ),
                minWidth: MediaQuery.of(context).size.width * 0.7,
                onPressed: () {
                  // Navigator.of(context).pushNamed('/otpUI');
                }),
          ),
        ],
      )),
    );
  }
}
