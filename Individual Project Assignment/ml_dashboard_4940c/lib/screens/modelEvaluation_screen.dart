import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/constants/responsive.dart';
import 'package:responsive_admin_dashboard/controllers/controller.dart';
import 'package:responsive_admin_dashboard/screens/components/modelEvaluation_content.dart';
import 'package:responsive_admin_dashboard/screens/screenController.dart';
import 'components/dataAnalysis_content.dart';
import 'components/modelInsights_content.dart';

import 'components/drawer_menu.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class ModelEvaluationScreen extends StatelessWidget {
  ModelEvaluationScreen({Key? key}) : super(key: key);
  final ScreenController screenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: DrawerMenu(),
      key: context.read<Controller>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) Expanded(child: DrawerMenu(),),
            Obx(() => 
              Expanded(
                flex: 5,
                child: (screenController.currentScreen.value == "Model's Evaluation")
                      ? ModelEvaluationContent()
                      : (screenController.currentScreen.value == "Exploratory Data Analysis")
                      ? DataAnalysisContent()
                      : ModelInsightsContent(),
              )            
            )
          ],
        ),
      ),
    );
  }
}
