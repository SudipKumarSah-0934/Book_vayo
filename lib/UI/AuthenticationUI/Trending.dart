import 'package:flutter/material.dart';

import '../../util/restaurants.dart';
import '../Model/Trending_Item.dart';

class Trending extends StatelessWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaede8),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("All Restaurants"),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundColor: const Color(0xffF8E0D2),
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
                height: 25,
              ),
            ),
          ),
          actions: const <Widget>[
             BackButton(
               color: Colors.black,
             )
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10.0,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: restaurants == null ? 0 : restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                Map restaurant = restaurants[index];
                return TrendingItem(
                  img: restaurant["img"],
                  title: restaurant["title"],
                  address: restaurant["address"],
                  rating: restaurant["rating"],
                  like: restaurant["likes"],
                );
              },
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}