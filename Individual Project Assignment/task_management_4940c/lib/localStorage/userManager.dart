import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'user.dart';
import 'toDoController.dart';

late Box userManager;

void putUserInfo() {
  final ToDoController c = Get.find<ToDoController>();
  User user = userManager.get("user");
  
  user.todoList = c.todoList;

  userManager.put("user", user);
}