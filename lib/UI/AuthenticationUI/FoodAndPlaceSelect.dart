import 'package:flutter/material.dart';
class FoodAndPlaceSelect extends StatefulWidget {
  const FoodAndPlaceSelect({Key? key}) : super(key: key);

  @override
  FoodAndPlaceSelectState createState() =>
      FoodAndPlaceSelectState();
}

class FoodAndPlaceSelectState extends State<FoodAndPlaceSelect> with TickerProviderStateMixin {

  final List<String> _foodType = ['Kathmandu', 'Chitwan','Newari', 'Maithili', 'Korean', 'Spanish', 'Italian', 'Mexican','Chinese','Japanese'];
  final List<String> _placeType = ['Kathmandu', 'Chitwan', 'Janakpur', 'Pokhara', 'Biratnagar'];

  final List<bool> _selected = [false, false, false, false, false, false, false, false,false,false];
  final List<bool> _selected1 = [false, false, false,false, false];

  Widget _buildFoodChips() {

    List<Widget> chips = [];

    for (int i = 0; i < _foodType.length; i++) {
      FilterChip filterChip = FilterChip(
        selected: _selected[i],
        label: Text(_foodType[i], style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.normal,)),
        elevation: 20,
        pressElevation: 20,
        shadowColor: Colors.white60,
        backgroundColor: const Color.fromRGBO(229, 229, 229, 90),
        selectedColor: const Color.fromRGBO(244, 152, 7, 100),
        showCheckmark: false,
        onSelected: (bool selected) {
          setState(() {
            _selected[i] = selected;
          });
        },
      );

      chips.add(Padding(

        padding: const EdgeInsets.all(4.0),
        child: filterChip,

      ));
    }

    return Wrap(
      // This next line does the trick.
      direction: Axis.horizontal,
      children: chips,
    );
  }
  Widget _buildPlaceChips() {

    List<Widget> chips = [];

    for (int i = 0; i < _placeType.length; i++) {
      FilterChip filterChip = FilterChip(
        selected: _selected1[i],
        label: Text(_placeType[i], style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.normal,)),
        elevation: 20,
        pressElevation: 20,
        shadowColor: Colors.white60,
        backgroundColor: const Color.fromRGBO(229, 229, 229, 90),
        selectedColor: const Color.fromRGBO(244, 152, 7, 100),
        showCheckmark: false,
        onSelected: (bool selected) {
          setState(() {
            _selected1[i] = selected;
          });
        },
      );

      chips.add(Padding(

        padding: const EdgeInsets.all(4.0),
        child: filterChip,

      ));
    }

    return Wrap(
      // This next line does the trick.
      direction: Axis.horizontal,
      children: chips,
    );
  }
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
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: const Text(
                    "Select Your Choice",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/4,
                  width: double.infinity,
                  child: _buildFoodChips(),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: const Text(
                    "City You Like To Be In",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/4,
                  width: double.infinity,
                  child: _buildPlaceChips(),
                ),
              ),
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                elevation: 18.0,
                color: const Color(0xFFF37440),
                child: MaterialButton(
                    child: const Text(
                      "Go to Home",
                      style: TextStyle(color: Colors.white),
                    ),
                    // color: Colors.orange,
                    minWidth: MediaQuery.of(context).size.width * 0.7,
                    onPressed: () {
                       Navigator.of(context).pushNamed('/landingPage');
                    }),
              )
            ],
          )
      ),
    );
  }

}