import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruitshop/data/data.dart';
import 'package:fruitshop/utils/utils.dart';

import '../widgets/nutrient_widget.dart';
import 'package:fruitshop/widgets/nutrient_widget.dart';

class DetailsScreen extends StatefulWidget {
  final  Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
          children: [
            // Prodcut image
            Container(
              height: size.height * 0.50,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20.0),
              color: widget.product.color,
              child: Transform.rotate(angle: 2.10 * pi,
              child: Image.asset(widget.product.image),
              ),
            ),

            // top buttons
            
           Positioned(
            top: 20,
            right: 20,
            left: 20,
            child:
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: iconWidget(FontAwesomeIcons.arrowLeft, false),
              ),
              Text(
                "Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: iconWidget(FontAwesomeIcons.bagShopping, true),
              ),
            ],
           ),
           ),


           // product Details
           Container(
            width: size.width,
            margin: EdgeInsets.only(top: size.height * 0.55),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                height: size.height * 0.80,
                child: 
                Column(
                  children: [
                    //product details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 10),
                            priceWidget(widget.product.price),
                          ],
                        ),
                    
                    Container(
                      width: 130,
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: boxShadow,
                      ),
                      child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // decrease quantity
                          quantityIcon(
                            onTap: (){}, 
                            color: Colors.black12, 
                            icon: FontAwesomeIcons.minus
                          ),


                          // quantity count
                          Text(itemCount.toString(), 
                          style: TextStyle(fontSize: 15, 
                          fontWeight: FontWeight.bold
                          ),
                          ),

                          // increase quantity
                          quantityIcon(
                            onTap: (){}, 
                            color: Colors.orangeAccent, 
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                      // Nutrients Details
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, 
                          childAspectRatio: 1.6),
                       shrinkWrap: true,
                       primary: false,
                       itemCount: 4,
                       itemBuilder: (context, index){
                        return NutrientWidget(
                        product: data[0].products![index], 
                        index: index
                        );
                       },
                      ),
                      // product Description
                      Padding(
                        padding: EdgeInsets.all(
                        8.0
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("Details",style: TextStyle(color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(height: 10),
                        Text("this product is very good and healty")
                      
                      ],
                      ),
                      )
          ],
          ),
            ),
           ),


           )
          ],
        ),
    );
  }
  Widget quantityIcon({
  required VoidCallback onTap, 
  required Color color, 
  required IconData icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
  
}