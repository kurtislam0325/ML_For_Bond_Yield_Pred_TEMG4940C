import 'todo_item.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

var uuid = const Uuid();

enum Status {TODO, INPROGRESS, ARCHIVED}

class ToDoController extends GetxController {
  RxList<ToDo> todoList = <ToDo>[].obs;
  RxBool isSortedAscendingly = true.obs;

  Future<ToDo> addToDo(String title) async {
    ToDo todo = ToDo(id: uuid.v1(), title: title);
    todoList.add(todo);

    await Amplify.DataStore.save(todo);
    sortToDoListByStatus();
    todoList.refresh();
    return todo;
  }

  void deleteToDo(String id) {
    todoList.removeWhere((todo) => todo.id == id);
    todoList.refresh();
  }

  void deleteAllToDos() {
    todoList.value = [];
    todoList.refresh();
  }

  void updateToDoStatus(String id) {
    var todo = todoList.firstWhere((todo) => todo.id == id);

    if (todo.status == Status.TODO) {
      todo.status = Status.INPROGRESS;
    } else if (todo.status == Status.INPROGRESS) {
      todo.status = Status.ARCHIVED;
    } else {
      todo.status = Status.TODO;
    }
    todoList.refresh();
  }

  void updateToDoPriority(String id) {
    var todo = todoList.firstWhere((todo) => todo.id == id);    
  }

  // sort todo By priority
  void sortToDoListByPriority(bool isSortedAscendingly) {
    print("sortToDoListByPriority");
    todoList.sort((a, b) => a.priority.compareTo(b.priority));

    if (isSortedAscendingly == false) {
      todoList.value = todoList.reversed.toList();
    }
    todoList.refresh();
  }

  void sortToDoListByStatus() {
    print("sortToDoListByStatus");
    todoList.sort((a, b) {
      if (a.status == b.status) {
        return a.priority.compareTo(b.priority);
      } else if (a.status == Status.TODO && b.status != Status.TODO) {
        return -1;
      } else if (a.status == Status.INPROGRESS && b.status == Status.ARCHIVED) {
        return -1;
      } else {
        return 1;
      }
    });
    todoList.refresh();    
  }
}
