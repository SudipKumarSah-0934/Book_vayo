import 'package:e_commerce/UI/Profile/ProfileUI.dart';
import 'package:flutter/material.dart';

class RewardsUI extends StatefulWidget {
  const RewardsUI({Key? key}) : super(key: key);

  @override
  _RewardsUIState createState() => _RewardsUIState();
}

class _RewardsUIState extends State<RewardsUI> {
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
        leading: IconButton(icon:const Icon(Icons.arrow_back), onPressed: () { Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProfileUI()),
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
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height*0.02,),
                        const Text(
                          'Rewards',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height:height*0.1,
                      width: width*0.15,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                        ),
//                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text('150',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.orange
                          ),
                        ),
                      ),
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
