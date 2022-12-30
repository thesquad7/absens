import 'dart:convert';

import 'package:absensi_anis/header/settings/modelcofiig.dart';
import 'package:absensi_anis/page/login/dasboard.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ngrockdata.dart';

class LoginState extends StatefulWidget {
  @override
  loginstate createState() => loginstate();
}

class UpdateAccount extends StatefulWidget {
  @override
  update createState() => update();
}

class Home extends StatefulWidget {
  @override
  home createState() => home();
}

class loginstate extends State<LoginState> {
  bool state = false;
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

  readPreference() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var stateSP = localStorage.getBool('state');
    setState(() {
      state = stateSP!;
    });
  }

  @override
  void initState() {
    super.initState();
    readPreference();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: state ? UpdateAccount() : Home(),
    );
  }
}

class update extends State<UpdateAccount> {
  String token = 'A';
  String? user, name;
  readPreference() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var tokenSP = localStorage.getString('token');
    var nameSP = localStorage.getString('user');
    var userSP = localStorage.getString('user_id');
    setState(() {
      token = tokenSP!;
      name = nameSP;
      user = userSP;
    });
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

  @override
  void initState() {
    super.initState();
    readPreference();
  }

  Kirim() async {
    try {
      var data = FormData.fromMap({
        'user_id': user.toString(),
        'name': name.toString(),
        'kelas': kelas.toString(),
        'tahun': tahun.toString(),
        'smester': smester.toString()
      });

      var dio = Dio();

      dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
      dio.options.headers['Authorization'] = 'Bearer $token';
      Response response =
          await dio.post(ngrok_client().link + '/api/first', data: data);
      Map body = response.data;
      print(response);
      if (body['success'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        setState(() {
          loginstate().state = false;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  String? kelas, tahun, smester;
  String? kelasname, tahunname, smestername;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Memulai"),
        ),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: h * 0.1,
          ),
          Container(
            width: w * 1,
            child: Center(
              child: Text(
                "Ayo Update akun mu :)",
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
          SizedBox(
            height: h * 0.1,
          ),
          Container(
            width: w * 0.85,
            height: h * 0.082,
            child: ListView(children: [
              DropdownSearch<Dropdown>(
                mode: Mode.MENU,
                onChanged: (value) {
                  kelas = value?.id;
                  kelasname = value?.name;
                },
                dropdownBuilder: (context, selectedItem) =>
                    Text(selectedItem?.name ?? "Pilih Kelas Kamu"),
                popupItemBuilder: (context, item, isSelected) => ListTile(
                  title: Text(item.name),
                ),
                onFind: (text) async {
                  try {
                    final res = await http.get(
                      Uri.parse(ngrok_client().link + '/api/kelas'),
                      headers: {
                        'Authorization': 'Bearer $token',
                      },
                    );
                    if (res.statusCode == 200) {
                      List HTTPMatakuliah = json.decode(res.body);
                      print(res.body);
                      List<Dropdown> role = [];
                      HTTPMatakuliah.forEach((element) {
                        role.add(
                          Dropdown(
                              id: element["id"].toString(),
                              name: element["name"]),
                        );
                      });
                      print(role);
                      return role;
                    } else {
                      return [];
                    }
                  } catch (e) {
                    return [];
                  }
                },
              ),
            ]),
          ),
          SizedBox(height: h * 0.02),
          Container(
            width: w * 0.85,
            height: h * 0.082,
            child: ListView(children: [
              DropdownSearch<Dropdown>(
                mode: Mode.MENU,
                onChanged: (value) {
                  tahun = value?.id;
                  tahunname = value?.name;
                },
                dropdownBuilder: (context, selectedItem) =>
                    Text(selectedItem?.name ?? "Pilih Tahun Masuk"),
                popupItemBuilder: (context, item, isSelected) => ListTile(
                  title: Text(item.name),
                ),
                onFind: (text) async {
                  try {
                    final res = await http.get(
                      Uri.parse(ngrok_client().link + '/api/tahun'),
                      headers: {
                        'Authorization': 'Bearer $token',
                      },
                    );
                    if (res.statusCode == 200) {
                      List HTTPMatakuliah = json.decode(res.body);

                      List<Dropdown> role = [];
                      HTTPMatakuliah.forEach((element) {
                        role.add(
                          Dropdown(
                              id: element["id"].toString(),
                              name: element["name"].toString()),
                        );
                      });

                      return role;
                    } else {
                      return [];
                    }
                  } catch (e) {
                    return [];
                  }
                },
              ),
            ]),
          ),
          SizedBox(height: h * 0.02),
          Container(
            width: w * 0.85,
            height: h * 0.082,
            child: ListView(children: [
              DropdownSearch<Dropdown>(
                mode: Mode.MENU,
                onChanged: (value) {
                  smester = value?.id;
                  smestername = value?.name;
                },
                dropdownBuilder: (context, selectedItem) =>
                    Text(selectedItem?.name ?? "Pilih Semester Kuliah Mu"),
                popupItemBuilder: (context, item, isSelected) => ListTile(
                  title: Text(item.name),
                ),
                onFind: (text) async {
                  try {
                    final res = await http.get(
                      Uri.parse(ngrok_client().link + '/api/smester'),
                      headers: {
                        'Authorization': 'Bearer $token',
                      },
                    );
                    if (res.statusCode == 200) {
                      List HTTPMatakuliah = json.decode(res.body);

                      List<Dropdown> role = [];
                      HTTPMatakuliah.forEach((element) {
                        role.add(
                          Dropdown(
                              id: element["id"].toString(),
                              name: element["name"]),
                        );
                      });
                      print(role);
                      return role;
                    } else {
                      return [];
                    }
                  } catch (e) {
                    return [];
                  }
                },
              ),
            ]),
          ),
          SizedBox(height: h * 0.05),
          Container(
            width: w * 0.5,
            height: h * 0.04,
            child: ElevatedButton(
                onPressed: () {
                  Kirim();
                },
                child: Text("Mulai")),
          )
        ]),
      ),
    );
  }
}

class home extends State<Home> {
  String? role;
  readPreference() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var stateSP = localStorage.getString('status');
    setState(() {
      role = stateSP!;
    });
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

  DasboardView() {
    if (role == '1') {
      return Dosen();
    }
    if (role == '2') {
      return Mahasiswa();
    } else {
      return Center(
        child: Text("Terjadi Kesalahan"),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    readPreference();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(body: DasboardView());
  }
}
