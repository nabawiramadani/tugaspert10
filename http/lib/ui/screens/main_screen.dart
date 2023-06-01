import 'package:flutter/material.dart';
import 'package:prak10crud/ui/pages/home_page.dart';
import 'package:prak10crud/ui/screens/create_user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "http",
        style: TextStyle(color: Colors.black),
      )),
      body: Homepage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateUserScreen()))
            .then((value) => setState(() {})),
      ),
    );
  }
}
