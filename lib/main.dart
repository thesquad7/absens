import 'package:absensi_anis/index.dart';
import 'package:absensi_anis/page/login/State.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPage(),
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoggedIn = false;
  String token = "";
  @override
  void initState() {
    // TODO: implement initState
    _checkLoginStatus();
    super.initState();
  }

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      // backgroundColor: Color(0xFF363f93),
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _checkLoginStatus() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var tokenLog = localStorage.getString('token');
    print(tokenLog);
    if (tokenLog != null) {
      setState(() {
        _isLoggedIn = true;
        token = tokenLog;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _isLoggedIn ? Home() : Welcome(),
      ),
    );
  }
}
