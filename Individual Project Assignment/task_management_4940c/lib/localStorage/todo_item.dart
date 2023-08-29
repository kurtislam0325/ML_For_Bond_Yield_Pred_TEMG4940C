import 'toDoController.dart';

class ToDo {
  String id;
  String title;
  Status status = Status.TODO;
  String description = '';
  int priority = 0;

  ToDo({
    required this.id,
    required this.title,
  });
}