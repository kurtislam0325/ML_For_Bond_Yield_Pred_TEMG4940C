import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/screens/components/analytic_cards.dart';
import 'package:responsive_admin_dashboard/screens/components/custom_appbar.dart';
import 'package:responsive_admin_dashboard/screens/components/top_referals.dart';
import 'features.dart';

class ModelInsightsContent extends StatelessWidget {
  const ModelInsightsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(appPadding),
        child: Column(
          children: [            
            CustomAppbar(),
            Container(
              padding: EdgeInsets.fromLTRB(0, 18, 0, 5),
              child: Text(
                "Model's Insights",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),             
            SizedBox(
              height: appPadding,
            ),
            Column(
              children: [              
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Container(
                            height: 380,
                            padding: EdgeInsets.all(appPadding),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Feature Importance',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: textColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: appPadding * 2,
                                ),
                                Expanded(
                                  child: Image.asset(
                                    "assets/images/Feature_Importances_Plot.png",
                                    fit: BoxFit.cover,
                                  )
                                ),          
                              ],
                            ),
                          ),
                          SizedBox(
                            height: appPadding,
                          ),                          
                          Container(
                            height: 380,
                            padding: EdgeInsets.all(appPadding),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Precision-Recall Curve',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: textColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: appPadding * 2,
                                ),
                                Expanded(
                                  child: Image.asset(
                                    'assets/images/precision_recall_curve.png',
                                    fit: BoxFit.cover,
                                  )
                                ),          
                              ],
                            ),
                          ),
                          SizedBox(
                            height: appPadding,
                          ),                          
                          Container(
                            height: 380,
                            padding: EdgeInsets.all(appPadding),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Learning Curve',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: textColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: appPadding * 2,
                                ),
                                Expanded(
                                  child: Image.asset(
                                    'assets/images/Learning_Curve.png',
                                    fit: BoxFit.cover,
                                  )
                                ),          
                              ],
                            ),
                          ),                                                    
                        
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
