// @dart=2.9
import 'package:e_commerce/UI/AuthenticationUI/HomePage.dart';
import 'package:e_commerce/UI/AuthenticationUI/HomePages.dart';
import 'package:e_commerce/UI/AuthenticationUI/OnBoardingUI.dart';
import 'package:e_commerce/UI/Profile/ProfileUI.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'UI/AuthenticationUI/AccountInfoUI.dart';
import 'UI/AuthenticationUI/FoodAndPlaceSelect.dart';
import 'UI/AuthenticationUI/LoginUI.dart';
import 'UI/AuthenticationUI/OTPUI.dart';
import 'UI/Profile/FaqUI.dart';
import 'UI/Profile/RecentBookingUI.dart';
import 'UI/Profile/RewardsUI.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
         //home:
        initialRoute: '/onBoardingUI',
        routes: {
          '/onBoardingUI': (context) => OnBoardingUI(),
          '/loginUI': (context) => LoginUI(),
          '/otpUI': (context) => OtpUI(),
          '/accountInfoUI': (context) => AccountInfoUI(),
          '/foodandplace': (context) =>FoodAndPlaceSelect(),
          '/landingPage':(context)=>HomePages(),
          '/UIprofile':(context)=>ProfileUI(),
          '/rewardsUI': (context) => RewardsUI(),
          '/recentBookingUI': (context) => RecentBookingUI(),
          '/faqUI': (context) => FaqUI(),
        });
  }
}
