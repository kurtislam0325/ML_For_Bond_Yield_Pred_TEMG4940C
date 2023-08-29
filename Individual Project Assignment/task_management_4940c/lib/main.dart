import 'package:flutter/material.dart';
import 'package:task_management_4940c/home/home.dart';
import 'package:task_management_4940c/localStorage/toDoController.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_management_4940c/localStorage/user.dart';
import 'package:task_management_4940c/localStorage/userManager.dart';

import 'package:task_management_4940c/models/ModelProvider.dart';
import 'amplifyconfiguration.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());

  userManager = await Hive.openBox('userManager'); 
  userManager.put("user", User(todoList: [])); // initalise user file to local storage 

  runApp(MyApp());
  
  putUserInfo(); // save data to local storage
  // await userManager.close();
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final ToDoController c = Get.put(ToDoController());
  bool _amplifyConfigured = false;
  
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }
  
  void _configureAmplify() async {
    try {
      Future.wait([
        Amplify.addPlugin(AmplifyAPI()),
        Amplify.addPlugin(AmplifyDataStore(modelProvider: ModelProvider.instance))
      ]);
      await Amplify.configure(amplifyconfig);

      print("Amplify configured successfully");
    } on Exception catch (e) {
      print(e);
    }
    
    setState(() {
      _amplifyConfigured = true;
    });
  }  

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: _amplifyConfigured ? const HomePage() : Container(),
    );
  }
}