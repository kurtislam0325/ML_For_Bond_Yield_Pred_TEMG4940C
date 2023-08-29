import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'todoList_widget.dart';
import '../localStorage/toDoController.dart';
import '../localStorage/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _searchController = TextEditingController();
  String searchText = '';
  final FocusNode _deleteButtonNode = FocusNode();
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _deleteButtonNode.addListener(() {
      setState(() {
        _isSelected = !_deleteButtonNode.hasFocus;   
        print(_isSelected);
      });

    });
  }

  @override
  Widget build(BuildContext context) {

    return 
    Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: BoxConstraints( 
            minWidth: MediaQuery.of(context).size.width * 0.7, // minimum width      
            maxWidth: MediaQuery.of(context).size.width,    
            maxHeight: MediaQuery.of(context).size.height,
        ),        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() {              
              return 
                Column(
                  children: [                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You Have ${c.todoList.length} Tasks Today",
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]
                    ),
                    const SizedBox(height: 30),                  
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Wrap(
                          direction: Axis.horizontal,
                            children: [              
                              ToDoList(statusTitle: Status.TODO, searchText: searchText,),
                              const SizedBox(width: 30),
                              ToDoList(statusTitle: Status.INPROGRESS, searchText: searchText,),
                              const SizedBox(width: 30),          
                              ToDoList(statusTitle: Status.ARCHIVED, searchText: searchText,),  
                            ],                 
                        ),
                      ),
                    ),
                  ],
                );  
              }        
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,            
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      labelText: 'Search a Task',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: IconButton(
                        padding: const EdgeInsets.symmetric(horizontal: 14  ),
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            searchText = _searchController.text;   
                          });
                        },
                      ),        
                    ),
                    onChanged: (value) {
                      // addTask();
                      setState(() {
                        searchText = value;   
                      });
                    },
                  ),
                ),
                const SizedBox(width: 20),
                DragTarget<ToDo>(
                  onWillAccept: (todo) => true,
                  onMove: (_) {
                    setState(() {
                      _isSelected = true;   
                    });
                  },   
                  onLeave: (_) {
                    setState(() {
                      _isSelected = false;   
                    });
                  },                               
                  onAccept: (todo) {
                    c.deleteToDo(todo.id);   
                    setState(() {
                      _isSelected = false;   
                    });                                 
                  },
                  builder: (context, candidateData, rejectedData) {
                    return 
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          isSelected: _isSelected,
                          selectedIcon: const Icon(Icons.delete_forever),
                          style: IconButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            minimumSize: const Size(6, 6),
                            iconSize: 30,         
                          ),
                          focusNode: _deleteButtonNode,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Confirm deletion'),
                                content: const Text('Are you sure you want to delete all tasks?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(false),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      c.deleteAllToDos();
                                      Navigator.of(context).pop(true);
                                    },
                                    child: const Text('Delete all'),
                                  ),
                                ],
                              ),
                            );                      
                          }
                        ),
                        const Text(
                          "Delete Task",
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),                        
                        )                      
                      ],
                    );
                  } 
                ),         
              ],
            ),          
          ],
        ),
      ),
    );
  }
}

