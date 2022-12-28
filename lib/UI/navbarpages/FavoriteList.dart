import 'package:e_commerce/UI/AuthenticationUI/HomePages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffaede8),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(icon:Icon(Icons.arrow_back), onPressed: () { Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HomePages()),
        ); },),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
          child:Stack(
            children: <Widget>[
              Positioned(
                left: 20,
                child: Text(
                  'Favorite',
                  style: GoogleFonts.actor(textStyle:TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                  ),),
              ),
              Container(
                height:MediaQuery.of(context).size.height/3.7,
                padding: EdgeInsets.only(
                  top: 50,
                  left: 16.0,
                  right: 16.0,
                ),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 120.0,left: 15,right: 15),
                decoration: new BoxDecoration(
                  color: Color(0xFFFF9A76), //Colors.black.withOpacity(0.3),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: const Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min, // To make the card compact
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    Text(
                      "Chicken Station",
                      style: GoogleFonts.actor(textStyle:TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),)
                    ),
                    SizedBox(height: 0.0),
                    Text(
                      "Janakpur Dham, Nepal",
                      textAlign: TextAlign.center,
                      style:GoogleFonts.actor(textStyle: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),)
                    ),
                    SizedBox(height: 10.0),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Liked',
                            style: GoogleFonts.actor(
                              textStyle: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFF7018),
                              padding: EdgeInsets.all(8),
                              elevation: 5,
                              side: BorderSide(
                                color: Color(0xFFFF7A46),
                                style: BorderStyle.solid,
                              ),
                              fixedSize: const Size(100, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                        ),
                        VerticalDivider(
                          thickness: 3,
                          color: Colors.black,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Book',
                            style: GoogleFonts.actor(
                              textStyle: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFF7018),
                              padding: EdgeInsets.all(8),
                              elevation: 5,
                              side: BorderSide(
                                color: Color(0xFFFF7A46),
                                style: BorderStyle.solid,
                              ),
                              fixedSize: const Size(100, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                        ),
                      ],),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 25,
                left: 16.0,
                right: 16.0,
                child: Image.asset(
                  'assets/img.png',
                  cacheHeight: 180,
                  cacheWidth:300,
                ),
              ),
            ],
          ),
      ),

    );
  }
}
