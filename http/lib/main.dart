import 'package:flutter/material.dart';
import 'package:prak10crud/ui/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Latihan HTTP",
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0),
        scaffoldBackgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      home: MainScreen(),
    );
  }
}
