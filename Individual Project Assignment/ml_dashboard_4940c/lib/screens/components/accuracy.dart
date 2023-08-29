import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/screens/components/radial_painter.dart';
import '../screenController.dart';
import 'package:get/get.dart';

class Accuracy extends StatefulWidget {
  const Accuracy({Key? key}) : super(key: key);

  @override
  State<Accuracy> createState() => _AccuracyState();
}

class _AccuracyState extends State<Accuracy> {
  final ScreenController screenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: appPadding),
      child: Container(
        height: 370,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Model\'s Accuracy',
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              margin: EdgeInsets.all(appPadding),
              padding: EdgeInsets.all(appPadding),
              height: 230,
              child: Obx(() {
                return (screenController.currentAccuracy.value == "LS") ?
                  CustomPaint(
                    foregroundPainter: RadialPainter(
                      bgColor: textColor.withOpacity(0.1),
                      lineColor: primaryColor,
                      percent: 0.76,
                      width: 18.0,
                    ),
                    child: Center(
                      child: Text(
                        '76%',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ) 
                : CustomPaint(
                    foregroundPainter: RadialPainter(
                      bgColor: textColor.withOpacity(0.1),
                      lineColor: primaryColor,
                      percent: 0.82,
                      width: 18.0,
                    ),
                    child: Center(
                      child: Text(
                        '82%',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );    
              })
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: (screenController.currentAccuracy.value == "RF")? primaryColor: textColor.withOpacity(0.2),
                        size: 10,
                      ),
                      SizedBox(width: appPadding /2,),
                      TextButton(
                        onPressed: () {
                          screenController.currentAccuracy.value = "RF";
                          setState(() {
                            
                          });
                        },
                        child: Text('Random Forest',style: TextStyle(
                          color: (screenController.currentAccuracy.value == "RF")? Colors.blue: textColor.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                        ),)
                      )
                    ],
                  ),                  
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: (screenController.currentAccuracy.value == "LS")? primaryColor: textColor.withOpacity(0.2),
                        size: 10,
                      ),
                      SizedBox(width: appPadding /2,),
                      TextButton(
                        onPressed: () {
                          screenController.currentAccuracy.value = "LS";
                          setState(() {});
                        },
                        child: Text(
                          'Logistic Regression',
                          style: TextStyle(
                            color: (screenController.currentAccuracy.value == "LS")? Colors.blue: textColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
