import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({Key? key}) : super(key: key);

  @override
  _ProfileUIState createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xfffaede8),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/16,),
                  Text(
                    'My Profile',
                    style: GoogleFonts.actor(
                      textStyle: const TextStyle(color: Colors.black, fontSize: 25.0),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Personal Details',
                          style: GoogleFonts.actor(
                            textStyle: const TextStyle(color: Colors.black, fontSize: 18.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style: TextButton.styleFrom(primary: Color(0xffFA4A0C)),
                          onPressed: () {
//                        Navigator.of(context).pushReplacementNamed('/profileUI');
                          },
                          child: const Text(
                            'Change',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Image.asset('profile.png',width:130,height: 150,colorBlendMode: BlendMode.darken,
                                fit: BoxFit.fitWidth,alignment: Alignment.topLeft,),
                              const VerticalDivider(
                                color: Colors.transparent,
                              ),
                              Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(),
                                    child: Text("Sudip Kumar Sah",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.normal),textAlign: TextAlign.start,),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text("Location",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal),textAlign: TextAlign.left),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text("+977-981-36-41615",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal),textAlign: TextAlign.start,),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text("DOB:1996-02-08",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal),textAlign: TextAlign.start,),
                                  ),
                                  Divider(),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(left:10,right: 40,bottom: 5),
                            child: Row(
                              children: [
                                Flexible(child: Text("People who loves: Italian, Chinese, Newari cuisines",textAlign: TextAlign.center,style: GoogleFonts.alata(
                                  textStyle: const TextStyle(color: Colors.black, fontSize: 14.0),
                                ),)),
                              ],
                            ),
                          )
                        ],
                      ),
                  ),
                  ),
                  const SizedBox(height: 10,),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Container(
                      height:height*0.07,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Recent Booking',style: TextStyle(
                              fontSize: 20,
                            ),),
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/recentBookingUI');
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height:10,),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Container(
                      height:height*0.07,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Rewards',style: TextStyle(
                              fontSize: 20,
                            ),),
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/rewardsUI');
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Container(
                      height:height*0.07,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Share App',style: TextStyle(
                              fontSize: 20,
                            ),),
                            IconButton(
                              icon: Icon(Icons.share),
                              color: Colors.orange,
                              onPressed: () {

                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Card( shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                    child: Container(
                      height:height*0.07,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Faq',style: TextStyle(
                              fontSize: 20,
                            ),),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/faqUI');
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height:20,),
                  TextButton(
                      child: const Text('Log Out',

                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                            color: Colors.black
                        ),
                      ),
                      onPressed: () {
                        print('Pressed');
                      }
                  )
                ],
              ),
            )),
      ),

    );
  }
}
