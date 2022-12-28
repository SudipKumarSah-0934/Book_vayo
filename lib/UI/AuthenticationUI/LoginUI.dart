import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor:  Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {},
            child: const Text("Skip",style: TextStyle(color:  Color.fromARGB(
                255, 250, 90, 30),decoration: TextDecoration.underline),),
            shape: const CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                // cursorColor: Theme.of(context).cursorColor,
                // initialValue: 'Phone Number',
                // maxLength: 20,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                elevation: 18.0,
                color: Colors.orange,
                // clipBehavior: Clip.antiAlias,
                child: MaterialButton(
                    child: Text(
                      "Proceed",
                      style: TextStyle(color: Colors.white),
                    ),
                    // color: Colors.orange,
                    minWidth: MediaQuery.of(context).size.width * 0.7,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/otpUI');
                    }),
              ),
              SizedBox(height: 10),
              // Align(
              //   alignment: Alignment.center,
              //   child: TextButton(
              //     style: TextButton.styleFrom(primary: Colors.black),
              //     onPressed: () {},
              //     child: Text(
              //       'Terms and Condition',
              //       style: TextStyle(fontSize: 16),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
