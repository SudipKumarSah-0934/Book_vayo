import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatefulWidget {
  final String img;
  final String title;
  final String address;
  final String rating;
  final String like;

  const SlideItem({
    required this.img,
    required this.title,
    required this.address,
    required this.rating,
    required this.like,
  }) : super();

  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Row(
      children: <Widget>[
        Container(
        height:200,
        width: MediaQuery.of(context).size.width/2.05,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            alignment: AlignmentDirectional.centerStart,
            image: AssetImage(widget.img),
            scale: 1.2,
            fit: BoxFit.fitHeight,
          ),
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                "eshiett1995",
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "4:33am",
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
      ),
      ],)

    );
  }
}
