import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/screens/components/drawer_list_tile.dart';
import 'package:get/get.dart';
import 'package:responsive_admin_dashboard/screens/screenController.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu({Key? key}) : super(key: key);
  final ScreenController screenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            // child: Image.asset("assets/images/logowithtext.png"),
          ),
          Obx(() {
            return Column(
              children: [
                ListTileTheme(
                  tileColor: (screenController.currentScreen.value == "Model's Evaluation") ? Colors.grey[200] : Colors.transparent,
                  child: 
                  DrawerListTile(
                    title: 'Model\'s Evaluation',
                    svgSrc: 'assets/icons/Dashboard.svg',
                    tap: () {
                      screenController.currentScreen.value = "Model's Evaluation";
                    }
                  ),            
                ),
                ListTileTheme(
                  tileColor: (screenController.currentScreen.value == "Exploratory Data Analysis") ? Colors.grey[200] : Colors.transparent,
                  child:
                  DrawerListTile(
                    title: 'Exploratory Data Analysis',
                    svgSrc: 'assets/icons/Statistics.svg',
                    tap: () {
                      screenController.currentScreen.value = "Exploratory Data Analysis";   
                      print("Exploratory Data Analysis");           
                    }
                  ),   
                ),
                ListTileTheme(
                  tileColor: (screenController.currentScreen.value == "Model's Insights") ? Colors.grey[200] : Colors.transparent,  
                  child:    
                  DrawerListTile(
                    title: 'Model\'s Insights',
                    svgSrc: 'assets/icons/BlogPost.svg',
                    tap: () {
                      screenController.currentScreen.value = "Model's Insights";
                      print("Model's Insights");
                    }
                  ),
                ),
              ],
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),
          DrawerListTile(
              title: 'Settings',
              svgSrc: 'assets/icons/Setting.svg',
              tap: () {}),
          DrawerListTile(
              title: 'Logout', svgSrc: 'assets/icons/Logout.svg', tap: () {}),
        ],
      ),
    );
  }
}
