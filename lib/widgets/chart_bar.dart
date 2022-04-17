import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  double amount;
  String day;

  ChartBar({Key? key, required this.amount, required this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(double calculatedAmount) {
      if (calculatedAmount < 0.3) {
        return Colors.green;
      } else if (calculatedAmount < 0.7) {
        return Theme.of(context).primaryColor;
      } else {
        return Theme.of(context).errorColor;
      }
    }

    return LayoutBuilder(
      builder: (ctx, constraints) {
        var textScaleFactor = MediaQuery.of(context).textScaleFactor;
        var actualBarHeight = constraints.maxHeight * 0.5;
        var calculatedAmount = amount / actualBarHeight;
        bool isOverFlowed = calculatedAmount >= 1;
        double barHeight = isOverFlowed ? 1 : calculatedAmount;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: constraints.maxHeight * 0.1,
                child: FittedBox(
                  fit: BoxFit.none,
                  child: Text(
                    '\$${amount.toStringAsFixed(0)}',
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16.0,
                    ),
                    textScaleFactor: textScaleFactor * 1.0,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              Container(
                width: 15,
                height: constraints.maxHeight * 0.5,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(220, 220, 220, 1),
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
                          color: getColor(calculatedAmount),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              Container(
                height: constraints.maxHeight * 0.1,
                child: FittedBox(
                  child: Text(
                    day,
                    style: TextStyle(fontSize: 16.0),
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: textScaleFactor * 1.0,
                  ),
                  fit: BoxFit.none,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/**
 * Another Way of Creating Bar
 *
 * /*Container(
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
 * */
