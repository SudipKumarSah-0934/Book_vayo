import 'package:e_commerce/UI/Model/Onboarding_contents.dart';
import 'package:e_commerce/UI/Model/Slidedot.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class OnBoardingUI extends StatefulWidget {
  const OnBoardingUI({Key? key}) : super(key: key);

  @override
  _OnBoardingUIState createState() => _OnBoardingUIState();
}

class _OnBoardingUIState extends State<OnBoardingUI> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }

      _controller.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // _pageChange(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaede8),
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          fit: BoxFit.contain,
          height: 25,
          alignment: Alignment.center,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Image.asset(
                            contents[i].image,
                            height: 150,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 35),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < contents.length; i++)
                      if (i == currentIndex) Slidedot(true) else Slidedot(false)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFF9A76)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                elevation: 18.0,
                color: const Color(0xFFF37440),
                // clipBehavior: Clip.antiAlias,
                child: MaterialButton(
                    child: const Text(
                      "Proceed",
                      style: TextStyle(color: Colors.white),
                    ),
                    minWidth: MediaQuery.of(context).size.width * 0.7,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/otpUI');
                    }),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  style: TextButton.styleFrom(primary: Colors.black),
                  onPressed: () {},
                  child: const Text(
                    'Terms and Condition',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}