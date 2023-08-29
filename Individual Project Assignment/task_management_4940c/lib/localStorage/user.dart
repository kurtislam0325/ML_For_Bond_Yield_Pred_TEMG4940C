import 'package:hive/hive.dart';
import 'todo_item.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  User({required this.todoList});

  @HiveField(0)
  List<ToDo> todoList = <ToDo>[];
}