import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruitshop/utils/utils.dart';

import '../data/data.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: product.color,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Transform.rotate(angle: 2.05 * pi,
            child: Image.asset(product.image,height: 80
            ),
            ),
          ),
           
           // Heart Icon
           Positioned(
            right: 0,
            top: 0,
            child: Container(
                  height: 30,
                  width: 30,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: boxShadow,
                  ),
                  child: Icon(FontAwesomeIcons.solidHeart, 
                  color: product.isSelected  ? Colors.red : Colors.black,size: 15
                  ),  
            ),
            ),
          
          
           //Product Details  
                Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 100,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(color: Colors.white,boxShadow: [
              // product  based  Box Shadow
              BoxShadow(
                color: product.color.withOpacity(0.5),
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0, 1)
              ),
                  ],
                  ),

               child: Column(
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16
                    ),
                  ),
              
              
               SizedBox(height: 5),
               priceWidget(product.price),

               SizedBox(height: 10),
               Row(
                children: [
                  Text("See More"),
                  SizedBox( width: 10),
                  Icon(
                    FontAwesomeIcons.arrowTrendUp,
                    color: Colors.green,
                    size: 16,
                  ),
                ],
               ),

                ],
               ),


                ),
               ),



        ],
      ),
    );
  }
}