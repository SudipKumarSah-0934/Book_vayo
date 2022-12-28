import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Profile/ProfileUI.dart';
import '../navbarpages/FavoriteList.dart';
import '../navbarpages/RestaurantList.dart';
import 'HomePage.dart';
class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    final _pageOptions = [
      HomePage(),
      FavoriteList(),
      RestaurantList(),
      ProfileUI()
    ];
    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }
    return Scaffold(
      backgroundColor: Color(0xfffaede8),
      body:  _pageOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
              color:Color(0xffFF7A46),
              size: 30,
            ),
            label: '',

          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.heart,
              color:Color(0xffFF7A46),
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.hotel,
                color: Color(0xffFF7A46),
                size: 30,
              ),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.solidUser,
                color: Color(0xffFF7A46),
                size: 30,
              ),
              label: ''
          )
        ], type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.black,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}
