import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruitshop/data/data.dart';
import 'package:fruitshop/utils/utils.dart';

class NutrientWidget extends StatelessWidget {
  final Product product;
  final int index;

  const NutrientWidget({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
              children: [
                Text(
                   product.nutrients[index][0],
                   style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                   ),
                ),
                  Text("${product.nutrients[index][1]}/5",
                  style: TextStyle(
                    color: product.nutrientsColor,
                    fontWeight: FontWeight.w700,
                  ),
                  ),
                 
              ],
          ),
          SizedBox(height: 5),
          // building the indicator
          Row(

            children: buildIndicators(
              
              product.nutrients[index][0],
              int.parse(product.nutrients[index][1],
              ),
            ),
          )
        ],
      ),
    );
  }


List<Widget> buildIndicators(String nutrientType, int value) {
  List<Widget> list = [];
  for (int i = 0; i< 5; i++){
    list.add(
      i < value
          ? indicator(true, nutrientType)
          : indicator(false, nutrientType),
      );
  }
  return list;
}
Widget indicator(bool isActive, String nutrientType){
  IconData? icon;
  switch(nutrientType){
    case "Energy":
    icon = FontAwesomeIcons.bolt;
    break;
    case "Freshness":
    icon = FontAwesomeIcons.glassWater;
    break;
    case "Vitamin":
    icon = Icons.rocket_launch_rounded;
    break;
    case "Calories":
    icon = FontAwesomeIcons.fire;
    break;

  }
  return Container(
padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
child: Icon(
  icon,
  color: isActive == true ? product.nutrientsColor : Colors.black12,
),
  );
}

}