import 'package:e_commerce/Api/api_call.dart';
import 'package:e_commerce/UI/AuthenticationUI/NotifyUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/restaurants.dart';
import '../Model/slide_item.dart';
import 'Trending.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffaede8),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning!!!",
                style: GoogleFonts.actor(
                  textStyle: const TextStyle(color: Colors.black, fontSize: 14.0),
                ),),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only( left: 5.0 ),
                    child: Text(
                      "JanakpurDham,Nepal",
                      style: GoogleFonts.actor(
                        textStyle: const TextStyle(color: Colors.black, fontSize: 11.0),
                      ),),
                  ), const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.keyboard_arrow_down_outlined)
                  ),
                ],
              ),
            ],
          ),
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundColor: Color(0xffF8E0D2),
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
                height: 25,
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications_on),
              color: Colors.black,
              iconSize: 24,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotifyUser()),
                );
              },
            ),
          ]),
      body: FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 10),
              child: ListView(
                children: [
                  // Image.network(snapshot.data.),
                  const SizedBox(height: 0.0),
                  buildSearchRow(context),
                  const SizedBox(height: 2),
                  buildImageSlide(context),
                  const SizedBox(height: 2.0),
                  buildRestaurantRow(snapshot.data['data']['live_area'], context),
                  buildRestaurantList(context),
                  buildPreference('Preference',context),
                  buildPreferenceList(context, snapshot.data['data']['venue']),
                  const SizedBox(height: 5,),
                  buildExplore(context),
                  const SizedBox(height: 10,),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),

    );
  }

  buildSearchRow(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: TextField(
        style: const TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          hintText: "Search Restaurant",
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          hintStyle: const TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        ),
        maxLines: 1,
      ),
    );
  }

  buildImageSlide(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(5.0),
      child: ImageSlideshow(
        width: double.maxFinite,
        height: 150,

        initialPage: 0,
        indicatorColor: Colors.orange,
        indicatorBackgroundColor: Colors.white,
        onPageChanged: (value) {
          debugPrint('Page changed: $value');
        },
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          Image.asset(
            'assets/splash2.png',
            fit: BoxFit.contain,
          ),
          Image.asset(
            'assets/splash2.png',
            fit: BoxFit.contain,
          ),
          Image.asset(
            'assets/splash2.png',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  buildRestaurantRow(String s, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$s",
          style:GoogleFonts.aclonica(textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w800,
          ),),
        ),
        FlatButton(
          child: Text(
            "See all",
            style: GoogleFonts.actor(textStyle:const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Trending();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  buildRestaurantList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: restaurants == null ? 0 : restaurants.length=2,
        itemBuilder: (BuildContext context, int index) {
          Map restaurant = restaurants[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SlideItem(
              img: restaurant["img"],
              title: restaurant["title"],
              address: restaurant["address"],
              rating: restaurant["rating"],
              like:restaurant["likes"]
            ),
          );
        },
      ),
    );

  }

  buildPreference(String s,BuildContext context) {
    return Container(
      width:  MediaQuery.of(context).size.width,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$s",
          style:GoogleFonts.aclonica(textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w800,
          ),),
        ),
        FlatButton(
          child: Text(
            "See all",
            style: GoogleFonts.actor(textStyle:const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Trending();
                },
              ),
            );
          },
        ),
      ],
  ),
    );}

  buildPreferenceList(BuildContext context, var venue) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(5.0),
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width/4,
    child: ListView(
    primary: false,
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
      children: <Widget>[
        FittedBox(
          child: FlatButton(
            textColor: Colors.black,
            height: 100.0,
            minWidth: MediaQuery.of(context).size.width/4,
            color: Colors.white,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  // child: Icon(FontAwesomeIcons.houseUser, color: Color(0xffFF7A46),size: 40,),
                  // child: Image.network(venue[0]['logo']),
                ),
                Text(venue[0]['name'], style: TextStyle(fontSize: 12))
              ],
            ),
          ),
        ),
        const SizedBox(width: 10,),
        FittedBox(
          child: FlatButton(
            textColor: Colors.black,
            height: 100.0,
            minWidth: MediaQuery.of(context).size.width/4,
            color: Colors.white,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(FontAwesomeIcons.toriiGate, color: Color(0xffFF7A46),size: 40,),
                ),
                Text('Outdoor',style: TextStyle(fontSize: 12),)
              ],
            ),
          ),
        ),
        const SizedBox(width: 10,),
        FittedBox(
          child: FlatButton(
            textColor: Colors.black,
            height: 100.0,
            minWidth: MediaQuery.of(context).size.width/4,
            color: Colors.white,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(Icons.family_restroom, color: Color(0xffFF7A46),size: 40,),
                ),
                Text('Family',style: TextStyle(fontSize: 12) )
              ],
            ),
          ),
        ),
        const SizedBox(width: 10,),
        FittedBox(
          child: FlatButton(
            textColor: Colors.black,
            height: 100.0,
            minWidth: MediaQuery.of(context).size.width/4,
            color: Colors.white,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(Icons.wine_bar, color: Color(0xffFF7A46),size: 40,),
                ),
                Text('Bars',style: TextStyle(fontSize: 12) )
              ],
            ),
          ),
        ),
        const SizedBox(width: 10,),
        FittedBox(
          child: FlatButton(
            textColor: Colors.black,
            height: 100.0,
            minWidth: MediaQuery.of(context).size.width/4,
            color: Colors.white,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(FontAwesomeIcons.meetup, color: Color(0xffFF7A46),size: 40,),
                ),
                Text('Meeting', style: TextStyle(fontSize: 12))
              ],
            ),
          ),
        ),
        const SizedBox(width: 10,),
        FittedBox(
          child: FlatButton(
            textColor: Colors.black,
            height: 100.0,
            minWidth: MediaQuery.of(context).size.width/4,
            color: Colors.white,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(FontAwesomeIcons.ebay, color: Color(0xffFF7A46),size: 40,),
                ),
                Text('Engagement',style: TextStyle(fontSize: 12),)
              ],
            ),
          ),
        ),
        const SizedBox(width: 10,),
        FittedBox(
          child: FlatButton(
            textColor: Colors.black,
            height: 100.0,
            minWidth: MediaQuery.of(context).size.width/4,
            color: Colors.white,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(Icons.family_restroom, color: Color(0xffFF7A46),size: 40,),
                ),
                Text('Wedding',style: TextStyle(fontSize: 12) )
              ],
            ),
          ),
        ),
        const SizedBox(width: 10,),
        FittedBox(
          child: FlatButton(
            textColor: Colors.black,
            height: 100.0,
            minWidth: MediaQuery.of(context).size.width/4,
            color: Colors.white,
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(Icons.wine_bar, color: Color(0xffFF7A46),size: 40,),
                ),
                Text('Birthday',style: TextStyle(fontSize: 12) )
              ],
            ),
          ),
        ),
      ],
    )
    );
  }

  buildExplore(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Explore More",
          style:GoogleFonts.aclonica(textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w800,
          ),),
        ),
        FlatButton(
          child: Text(
            "See all",
            style: GoogleFonts.actor(textStyle:const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),),
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (BuildContext context) {
            //       return Trending();
            //     },
            //   ),
            // );
          },
        ),
      ],
    );
  }
}

