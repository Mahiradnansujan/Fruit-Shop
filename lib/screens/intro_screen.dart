import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text("HELLO CONSUMER!",
            style: TextStyle(
              fontSize: 18, color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.1,
            ),
            ),
            
            SizedBox(height: 10),

            Text("Orchid Agro",
            style: TextStyle(
              fontSize: 60, color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.1,
            ),
            ),

            Text("ORGANIC FOOD",
            style: TextStyle(
              fontSize: 40, color: Color.fromARGB(255, 239, 13, 122),
              fontWeight: FontWeight.bold,
              letterSpacing: 0.1,
            ),
            ),

            SizedBox(height: 10),

            Text("We serve organic Food. We always Provide Fresh Item. We serve food anywhere in Bangladesh",
            style: TextStyle(
              fontSize: 10, color: Color.fromARGB(255, 12, 61, 255),
        
            ),
            ),

            
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/bg.png",),
            ),

            Spacer(),
            Column(
              children: [
                //slider
                SlideAction(
                  outerColor: Colors.red,
                  sliderButtonIcon: Icon(FontAwesomeIcons.arrowRight,
                  size: 20,
                  color: Colors.green,
                  ),
                  text: "SWIPE ME",
                  textStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white
                  ),
                  onSubmit: (){
                    //Delay of 500 milliseconds before next screen push
                    Timer(Duration(milliseconds: 500),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen(),
                      ),
                    ),
                    );
                    },
                          
                  


                ),
                
                SizedBox(height: 20),

                RichText(
                text: 
                TextSpan(
                  children: [
                  TextSpan(
                  text: "24 HOURS SUPPORT  ",
                  style: TextStyle(
                    color: Colors.orangeAccent, 
                  fontSize: 13, 
                  fontWeight: FontWeight.bold,
                  ),
                ),
                
                  TextSpan(
                  text: "LOCAL FARMER",
                  style: TextStyle(
                  color: Colors.blue, 
                  fontSize: 13, 
                  fontWeight: FontWeight.bold,
                 decoration: TextDecoration.underline,
                  ),
                ),
              ],
                ),
                ),
              ],
            ),
            



          ],
        ),

        ),
        ),
    );
  }
}