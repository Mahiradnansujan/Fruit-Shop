import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruitshop/screens/details_screen.dart';
import 'package:fruitshop/utils/utils.dart';
import 'package:fruitshop/widgets/product_widget.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
             padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 //Top container
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blueGrey,
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome Dear", 
                          style: 
                          TextStyle(color: Colors.black,
                          fontSize: 15, fontWeight: FontWeight.w300
                          ),
                          ),
                          SizedBox(height: 5),
                          Text("Mahir Adnan Sujan", 
                          style: 
                          TextStyle(color: Colors.black,
                          fontSize: 20, 
                          fontWeight: FontWeight.w300
                          ),
                          ),
                        ],
                      ),

                      Spacer(),
                      //icon widget
                      iconWidget(FontAwesomeIcons.bagShopping, true),
                    ],
                  ),

                  SizedBox(height: 30),
                  
                  //tagline
                  RichText(
                  text: 
                  TextSpan(
                        children: [
                          TextSpan(
                            text: "Get Your Fresh Foood \n",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "With ",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "Orchid Agro",
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                  ),
                  ),
                 
                 
                 SizedBox(height: 30),
                 //search Bar
                 Row(
                  children: [
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 0.70,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: boxShadow,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 25,
                            color: Colors.red,
                          ),
                          SizedBox(width: 15),
                          Text("Search Fruits",
                          style: TextStyle(fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Colors.black38
                          ),
                          )
                        ],
                      ),
                    ),

                    Spacer(),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(FontAwesomeIcons.filter,
                      color: Colors.white,
                      ),
                    ),
                  ],
                 ),


                 //Category List
                 SizedBox(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 20.0),
                    itemBuilder: (context, index){
                      // for internal padding of context
                      return Padding(padding: EdgeInsets.all(10.0),
                      child: Text(
                        data[index].name,
                        style: TextStyle(
                        fontSize: 16, 
                        color: index == 0 ? Colors.red : Colors.black45,
                        fontWeight: index ==0 ? FontWeight.bold : FontWeight.w400
                        ),
                      ),
                      );
                    },
                    ),
                 ),
               

                 //Products Grid View
                 GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  crossAxisSpacing: 10, mainAxisSpacing: 40,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: data[0].products!.length,
                  itemBuilder: (context, index){
                     return GestureDetector(
                      onTap: () => Navigator.push(
                        context, 
                        MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                      product: data[0].products![index]
                      ),
                      ),
                      ),
                      child: ProductWidget(product: data[0].products![index]),
                     );
                  },
                  ) 
              ],
              
             ),
        ),
        ),
    );
  }
}