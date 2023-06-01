import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prak10crud/core/https/user_http.dart';
import 'package:prak10crud/core/models/user.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: UserHttp().listOfusers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData && snapshot.hasError) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView(
          children:
              snapshot.data!.map((e) => itemCategory(e, context)).toList(),
        );
      },
    );
  }

  Widget itemCategory(User data, BuildContext context) {
    return ListTile(
      title: Text(data.name ?? ""),
      trailing: GestureDetector(
        onTap: () => _showCupertinoDialog(data, context),
        child: Icon(Icons.more_horiz),
      ),
    );
  }

  void _showCupertinoDialog(User data, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Delete User?'),
            content: Text('cannot restored if you select yes'),
            actions: [
              TextButton(
                  onPressed: () async {
                    var resp = await UserHttp().deleteUsers(data.id!);
                    if (resp) {
                      Navigator.pop(context);
                      Fluttertoast.showToast(msg: "Success Delete User");
                      setState(() {});
                    }
                  },
                  child: Text('yes')),
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('No')),
            ],
          );
        });
  }
}
