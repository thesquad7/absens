// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:absensi_anis/header/settings/modelcofiig.dart';
import 'package:absensi_anis/page/login/State.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {
  @override
  welcome createState() => welcome();
}

class Register extends StatefulWidget {
  @override
  register createState() => register();
}

class welcome extends State<Welcome> {
  late TextEditingController? _id_pengguna;
  late TextEditingController? _password;

  @override
  void initState() {
    super.initState();
    _id_pengguna = TextEditingController();
    _password = TextEditingController();
  }

  Kirim() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    try {
      var data = FormData.fromMap({
        'id_pengguna': _id_pengguna?.text,
        'password': _password?.text,
      });

      var dio = Dio();

      dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
      Response response =
          await dio.post('http://10.0.2.2:8000/api/login', data: data);
      Map body = response.data;
      print(body);
      if (body['first'] == true) {
        localStorage.setBool('state', body['first']);
        localStorage.setString('token', body['access_token']);
        localStorage.setString('user', body['user']);
        localStorage.setString('user_id', body['id']);
      } else {
        localStorage.setString('token', body['access_token']);
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginState()),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          child: Text(
            'E-Absens',
            style: TextStyle(fontSize: 40),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              height: h * 0.42,
              width: w * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    controller: _id_pengguna,
                    decoration: const InputDecoration(
                      hintText: 'merupakan NIP atau NIM?',
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: h * 0.04),
                  TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(
                      hintText: 'apa kamu masih ingat?',
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.key),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 14),
                    ),
                    onPressed: () {},
                    child: const Text('Lupa Kata Sandi?'),
                  ),
                  Container(
                    width: w * 0.85,
                    child: Center(
                      child: Container(
                        width: w * 0.4,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {
                            Kirim();
                          },
                          child: Text("Masuk"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.015,
                  ),
                  Container(
                    width: w * 0.85,
                    child: Center(child: Text("Belum terdaftar?")),
                  ),
                  SizedBox(
                    height: h * 0.015,
                  ),
                  Container(
                    width: w * 0.85,
                    child: Center(
                      child: Container(
                        width: w * 0.4,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.amber),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text("Daftar"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    ));
  }
}

class register extends State<Register> {
  late TextEditingController? _id_pengguna;
  late TextEditingController? _password;
  late TextEditingController? _name;

  @override
  void initState() {
    super.initState();
    _id_pengguna = TextEditingController();
    _password = TextEditingController();
    _name = TextEditingController();
  }

  Kirim() async {
    try {
      var data = FormData.fromMap({
        'name': _name?.text,
        'id_pengguna': _id_pengguna?.text,
        'password': _password?.text,
        'role_id': roledrop
      });

      var dio = Dio();

      dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
      Response response =
          await dio.post('http://10.0.2.2:8000/api/registrasi', data: data);
      Map body = response.data;
      print(response);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Welcome()),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  String? rolename;
  String? roledrop;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(child: Text('Registrasi Akun')),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: Text(
              "Let's get Started ",
              style: TextStyle(fontSize: 40),
            ),
          ),
          Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                height: h * 0.48,
                width: w * 0.85,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        hintText: 'menyesuaikan nama di KITAS?',
                        labelText: 'Nama Lengkap',
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: h * 0.02),
                    TextFormField(
                      controller: _id_pengguna,
                      decoration: const InputDecoration(
                        hintText: 'merupakan NIP/NIM ?',
                        labelText: 'NIM/NIP',
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.badge),
                      ),
                    ),
                    SizedBox(height: h * 0.02),
                    Container(
                      width: w * 0.85,
                      height: h * 0.082,
                      child: ListView(children: [
                        DropdownSearch<Dropdown>(
                          mode: Mode.MENU,
                          onChanged: (value) {
                            roledrop = value?.id;
                            rolename = value?.name;
                          },
                          dropdownBuilder: (context, selectedItem) =>
                              Text(selectedItem?.name ?? "Pilih Status Akun"),
                          popupItemBuilder: (context, item, isSelected) =>
                              ListTile(
                            title: Text(item.name),
                          ),
                          onFind: (text) async {
                            try {
                              final res = await http.get(
                                Uri.parse('http://10.0.2.2:8000/api/role'),
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
                    SizedBox(height: h * 0.015),
                    TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(
                        hintText: 'ayo buat yang unik?',
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.key),
                      ),
                    ),
                    SizedBox(height: h * 0.05),
                    Container(
                      width: w * 0.85,
                      child: Center(
                        child: Container(
                          width: w * 0.4,
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {
                              Kirim();
                            },
                            child: Text("Daftarkan"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
