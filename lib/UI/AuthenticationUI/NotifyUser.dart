import 'package:flutter/material.dart';
import '../AuthenticationUI/HomePage.dart';
import 'HomePages.dart';
class NotifyUser extends StatelessWidget {
  NotifyUser({Key? key}) : super(key: key);
  final ScrollController  _scrollController = ScrollController();
  Widget ListofRewards(BuildContext context, int index, double width, double height){

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      height:height*0.2,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Colors.orange,
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:8.0,left: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Points: $index',style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                ),),
                const Divider(),
                const Text('Hotel Name',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
                const Text('Hotel Address'),
                const Text('Book Id:'),
                const Text('Date:')
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('img_2.png',width: width*0.25,
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfffaede8),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(icon:const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) =>
                  HomePages()),
            ); },),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Notification",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_on),
                      color: Colors.black,
                      iconSize: 30,
                      onPressed: () {
                      },
                    )
                  ],
                ),
                SizedBox(height: height*0.01,),
                ListView.builder(
                  controller: _scrollController,
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return ListofRewards(context, index, width, height);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
