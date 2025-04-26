// import 'package:bai2/smarttasks/detail_s2.dart';
import 'package:flutter/material.dart';
import 'splash/splash.dart';
// import 'package:bai2/smarttasks/todo_list.dart';
// import '../smarttasks/list_empty.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Splash_Screen(),
      // home: TodoList(),
      // home: ListEmpty(),
    );
  }
}
