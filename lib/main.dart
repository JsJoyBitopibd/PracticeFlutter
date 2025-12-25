import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'home_screen.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  MyApp({super.key});

  Widget build(BuildContext context){
    return MaterialApp(
      title: "Flutter DEMO API",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
