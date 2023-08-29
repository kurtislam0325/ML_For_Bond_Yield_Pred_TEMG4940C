import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:task_management_4940c/AppTheme.dart';
import 'package:task_management_4940c/localStorage/toDoController.dart';
import 'package:task_management_4940c/localStorage/todo_item.dart';

final ToDoController c = Get.find();

class ToDoList extends StatefulWidget {
  const ToDoList({required this.statusTitle, required this.searchText, super.key});

  final Status statusTitle;
  final String searchText;

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  final TextEditingController _titleController = TextEditingController();

  void _addTask() {
    if (_titleController.text.isNotEmpty) {
      var todo = c.addToDo(_titleController.text);
      todo.status = widget.statusTitle;
      _titleController.clear();    
    }   
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int numOfToDo = 0;    
    for (var todo in c.todoList) {
      if (todo.status == widget.statusTitle) {
        numOfToDo++;
      }
    }
    return DragTarget<ToDo>(
      onWillAccept: (todo) => true,
      onAccept: (todo) {
        if (todo.status != widget.statusTitle) { // change todo status by Dragging
          todo.status = widget.statusTitle;
          c.todoList.refresh();
        } else { // change todo priority by Dragging in the toDoList vertically
          int index = c.todoList.indexOf(todo);
          if (index > 0) {
            if (c.todoList[index - 1].priority > todo.priority) {
              int temp = c.todoList[index - 1].priority;
              c.todoList[index - 1].priority = todo.priority;
              todo.priority = temp;
              c.todoList.refresh();
            }
          }
        }
      },
      builder: (context, candidateData, rejectedData) {
        return Card(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.height * 0.45,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.statusTitle.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "$numOfToDo",
                          style: const TextStyle(
                            fontSize: 14,
                            fontFeatures: [
                              FontFeature.enable('subs'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          c.isSortedAscendingly.value = !c.isSortedAscendingly.value;
                        });
                        c.sortToDoListByPriority(c.isSortedAscendingly.value);                    
                      },
                      icon: (c.isSortedAscendingly.value)
                            ? const Icon(Icons.arrow_upward)
                            : const Icon(Icons.arrow_downward),
                    ),
                  ],
                ),
                Expanded(              
                  child: ReorderableListView.builder(
                    shrinkWrap: true,
                    onReorder: (oldIndex, newIndex) {
                      if (newIndex > oldIndex) { // adjust newIndex
                        newIndex -= 1;
                      }                     

                      ToDo draggedToDo = c.todoList.removeAt(oldIndex);
                      if (newIndex > oldIndex) { // move down, decrease priority
                        if (c.isSortedAscendingly.value) {
                          draggedToDo.priority = max(0, c.todoList[newIndex - 1].priority - 1);
                        } else  {
                          draggedToDo.priority = min(4, c.todoList[newIndex - 1].priority + 1);   
                        }
                      } else if (newIndex < oldIndex) { // move up, increase priority 
                        if (c.isSortedAscendingly.value) {
                          draggedToDo.priority = min(4, c.todoList[newIndex].priority + 1);
                        } else {
                          draggedToDo.priority = max(0, c.todoList[newIndex].priority - 1);
                        }
                      }

                      c.todoList.insert(newIndex, draggedToDo);
                      c.todoList.refresh();                                   
                    },                    
                    proxyDecorator: (child, index, animation) 
                    => Material( // remove white background when dragging               
                      color: Colors.transparent, 
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: child
                      ),
                    ),                      
                    buildDefaultDragHandles: false,
                    itemCount: c.todoList.length,
                    itemBuilder: (context, index) {                    
                      if (c.todoList[index].status == widget.statusTitle
                          && c.todoList[index].title.contains(widget.searchText)) {
                        return ToDoWidget(
                          key: ValueKey(c.todoList[index].id),
                          todo: c.todoList[index],
                        );
                      } 
                      return SizedBox(key: ValueKey('empty$index'));
                    }
                  ),
                ),
                TextField(
                  controller: _titleController,  
                  decoration: InputDecoration(                  
                    border: InputBorder.none,
                    hintText: 'Add a Task',                  
                    prefixIcon: IconButton(   
                      padding: const EdgeInsets.all(0),                 
                      onPressed: _addTask,
                      icon: const Icon(Icons.add),
                    ),            
                  ),
                  onSubmitted: (value) {
                    _addTask();
                  }                  
                )  
              ],
            ),
          ),
        );
      },
    );
  }
}

class ToDoWidget extends StatefulWidget {
  ToDoWidget({Key? key, required this.todo,}): super(key: key);

  final ToDo todo;
  @override

  State<ToDoWidget> createState() => _ToDoWidgetState();
}

class _ToDoWidgetState extends State<ToDoWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final FocusNode _titleNode = FocusNode();
  final FocusNode _descriptionNode = FocusNode();

  @override
  void dispose() {
    _titleNode.dispose();
    _descriptionNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.todo.title;
    _descriptionController.text = widget.todo.description;
    print("build ToDoWidget");
    return GestureDetector(
      child: LongPressDraggable<ToDo>(
        key: widget.key,
        data: widget.todo,
        dragAnchorStrategy: pointerDragAnchorStrategy,
        feedback: Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Text(widget.todo.title),
          ),
        ),
        childWhenDragging: const SizedBox(),
        child: 
        Container(
          height: 60,
          padding: const EdgeInsets.fromLTRB(16, 4, 4, 4),
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 250, 247, 252),
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),    
            boxShadow: const [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 0.5,
                    spreadRadius: 0.0,
                    // offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
            ],                    
          ),
          child: Row(
            children: [
              IconButton( // leading
                onPressed: () {
                  widget.todo.status = Status.ARCHIVED;
                  c.todoList.refresh();
                },
                icon: (widget.todo.status == Status.ARCHIVED)
                      ? const Icon(Icons.check_box)
                      : (widget.todo.status == Status.INPROGRESS) 
                      ? const Icon(Icons.check_box_outlined)
                      : const Icon(Icons.check_box_outline_blank),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox( // title
                  height: 72,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: _titleController,
                              focusNode: _titleNode,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 10),
                                isDense: true,
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 15,
                                height: 1,
                                decoration: (widget.todo.status == Status.ARCHIVED) ? TextDecoration.lineThrough : null,                                
                              ),
                              onSubmitted: (value) {
                                widget.todo.title = _titleController.text;
                                _titleNode.unfocus();                              
                              },
                            ),
                            
                            TextField(
                              controller: _descriptionController,
                              focusNode: _descriptionNode,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                                border: InputBorder.none,
                                hintText: 'Add a description',
                              ),
                              style: const TextStyle(
                                fontSize: 12,
                                height: 1,
                              ),
                              onSubmitted: (value) {
                                widget.todo.description = _descriptionController.text;
                                _descriptionNode.unfocus();                              
                              },
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              IconButton(
                                style: IconButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  minimumSize: const Size(6, 6),
                                ),
                                onPressed: () {
                                  widget.todo.priority = (widget.todo.priority + 1) % 5;
                                  c.sortToDoListByPriority(c.isSortedAscendingly.value);
                                },
                                icon: Icon(
                                  Icons.priority_high,
                                  size: 20,
                                  color: AppTheme.priorityColor[widget.todo.priority],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Text(
                                  "${widget.todo.priority + 1}",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontFeatures: [
                                      FontFeature.enable('subs'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              minimumSize: const Size(6, 6),
                            ),
                            onPressed: () {
                              c.updateToDoStatus(widget.todo.id);
                            },
                            child: Text(widget.todo.status.name),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ), 
              const SizedBox(width: 10.0),
              ReorderableDragStartListener( // trailing
                index: c.todoList.indexOf(widget.todo),              
                child: Container(
                  color: Colors.transparent,
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.01,
                  child: const VerticalDivider(thickness: 4, color: Colors.black,)
                )                
              ),                 
            ],
          ),            
        ),
      ),
    );
  }
}