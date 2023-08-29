import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/screens/components/analytic_cards.dart';
import 'package:responsive_admin_dashboard/screens/components/custom_appbar.dart';
import 'package:responsive_admin_dashboard/screens/components/top_referals.dart';
import 'package:responsive_admin_dashboard/screens/components/class_distribution.dart';
import 'package:responsive_admin_dashboard/screens/components/accuracy.dart';
import 'package:responsive_admin_dashboard/screens/components/viewers.dart';

import 'features.dart';

class DataAnalysisContent extends StatelessWidget {
  const DataAnalysisContent({Key? key}) : super(key: key);

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
                "Exploratory Data Analysis",
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
                          ClassDistribution(),
                          SizedBox(
                            height: appPadding,
                          ),                                
                          Features(),                      
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
