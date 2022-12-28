import 'package:flutter/material.dart';
class RestaurantList extends StatelessWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      ),
      body:Container(child: Text("restaurant list")),
    );
  }
}
