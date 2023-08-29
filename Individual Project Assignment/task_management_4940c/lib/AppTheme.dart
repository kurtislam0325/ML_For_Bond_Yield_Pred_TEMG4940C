import 'package:flutter/material.dart';

class AppTheme{
  static const TextStyle customDialogButton = TextStyle(fontSize: 18,color: Color.fromRGBO(71, 128, 223, 1) );

  static const TextStyle customDialogMessage = TextStyle(fontSize: 16, overflow:TextOverflow.visible,fontWeight: FontWeight.w500,);
  static const MaterialColor ustBlue = MaterialColor(
    0xFF003366,
    <int, Color>{
      50: Color(0xFFE1F0F8),
      100: Color(0xFFB3D1E9),
      200: Color(0xFF80B3DA),
      300: Color(0xFF4D95CB),
      400: Color(0xFF267FBF),
      500: Color(0xFF006699),
      600: Color(0xFF005C8C),
      700: Color(0xFF005080),
      800: Color(0xFF004674),
      900: Color(0xFF00395E),
    },
  );
  
  static List<Color> priorityColor = [
    Colors.red.shade700,    
    Colors.orange.shade700,    
    Colors.yellow.shade700,    
    Colors.blue.shade700,
    Colors.green.shade700,
  ];      
}
