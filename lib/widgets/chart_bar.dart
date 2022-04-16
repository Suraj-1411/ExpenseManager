import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  double amount;
  String day;

  ChartBar({Key? key, required this.amount, required this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var calculatedAmount = amount / 100;
    bool isOverFlowed = calculatedAmount >= 1;
    double barHeight = isOverFlowed ? 1 : calculatedAmount;

    Color getColor(){
      if(calculatedAmount < 0.3){
       return Colors.green;
      }
      else if(calculatedAmount < 0.7){
        return Theme.of(context).primaryColor;
      }else{
        return Theme.of(context).errorColor;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('\$${amount.toStringAsFixed(0)}'),
          const SizedBox(
            height: 5,
          ),
          /*Container(
            width: 15,
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromRGBO(220, 220, 220, 1),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: barHeight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: barColor,
                ),
              )
            ),
          ),*/
          Container(
            width: 15,
            height: 100,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: barHeight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: getColor(),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(day),
        ],
      ),
    );
  }
}
