import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TrendingItem extends StatefulWidget {
  final String img;
  final String title;
  final String address;
  final String rating;
  final String like;

  const TrendingItem({
    required this.img,
    required this.title,
    required this.address,
    required this.rating,
    required this.like,
  }) : super();

  @override
  _TrendingItemState createState() => _TrendingItemState();
}

class _TrendingItemState extends State<TrendingItem> {
  Color _favIconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.2,
      width: MediaQuery.of(context).size.width,
      child:Card(
        semanticContainer: true,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 3.0,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  height: MediaQuery.of(context).size.height / 4.5,
                  width: MediaQuery.of(context).size.width/3,
                  child: ClipRect(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      height: double.infinity,
                      width: 103,
                      child: Image.asset(
                        widget.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 4.0,
                  right: 3.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.star,
                            color: Colors.deepOrange,
                            size: 18,
                          ),
                          Text(
                            " ${widget.rating} ",
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.only(top:10.0,right: 90.0,left: 110),
                  child: Text(
                    widget.title,
                    style:GoogleFonts.aclonica(
                        textStyle:const TextStyle(
                          fontSize: 16.0,
                          //fontWeight: FontWeight.w800,
                        )),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0,right: 120,left: 110),
                  child: Text(
                    widget.address,
                    style:GoogleFonts.actor(
                      textStyle:const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),textAlign: TextAlign.right,
                  ),),
                const SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.only(top: 55.0,right: 120,left: 110),
                  child: Text(
                    "Veg & Non-veg",
                    style:GoogleFonts.actor(
                      textStyle:const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),textAlign: TextAlign.right,
                  ),),
                const SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.only(top: 75.0,right: 120,left: 110),
                  child: Text(
                    "Open at 9am-12pm",
                    style:GoogleFonts.actor(
                      textStyle:const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),textAlign: TextAlign.right,
                  ),),
                const SizedBox(height: 5.0),
                Padding(
                    padding: const EdgeInsets.only(top: 95,right: 120,left: 105.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(Icons.location_on_sharp, size: 24,color: Color(0xFFFF7A46),),
                          ),
                          TextSpan(
                            text: "1.5 km ",style: GoogleFonts.actor(textStyle:const TextStyle(fontSize: 16.0,
                              fontWeight: FontWeight.w300,color: Colors.black)
                          ),),
                        ],
                      ),
                    )
                ),
                const SizedBox(height: 5.0),
                Positioned(
                  bottom: 0,
                  right: 100,
                  child:IconButton(
                    icon: const Icon(Icons.favorite_sharp),
                    color: _favIconColor,
                    iconSize: 37,
                    tooltip: 'Add to favorite',
                    onPressed: () {
                      setState(() {
                        if(_favIconColor == Colors.grey){
                          _favIconColor = const Color(0xffFA4A0C);
                        }else{
                          _favIconColor = Colors.grey;
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.only(top: 125.0, right: 120, left: 110),
                  child: Text(
                    "${widget.like} people love this",
                    style: GoogleFonts.actor(
                      textStyle: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(height: 5.0),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Book' ,style: GoogleFonts.actor(textStyle: const TextStyle(fontSize: 12.0,color: Color(0xFFFF7A46)),),),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: const EdgeInsets.all(10),
                        elevation: 5,
                        side: const BorderSide(
                          color: Color(0xFFFF7A46), style: BorderStyle.solid,),
                        fixedSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}