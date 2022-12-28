import 'package:flutter/material.dart';

class AccountInfoUI extends StatefulWidget {
  const AccountInfoUI({Key? key}) : super(key: key);

  @override
  _AccountInfoUIState createState() => _AccountInfoUIState();
}

class _AccountInfoUIState extends State<AccountInfoUI> {
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [

                const Text(
                  'Create an account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Welcome Friend enter your details so lets get started in booking table',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Image.asset(
                  'profile.png',
                  height: 100,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm password',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  elevation: 18.0,
                  color: const Color(0xFFF37440),
                  child: MaterialButton(
                      child: const Text(
                        "Complete",
                        style: TextStyle(color: Colors.white),
                      ),
                      // color: Colors.orange,
                      minWidth: MediaQuery.of(context).size.width * 0.7,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/foodandplace');
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
