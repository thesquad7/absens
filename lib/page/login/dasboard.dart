import 'dart:convert';

import 'package:absensi_anis/main.dart';
import 'package:absensi_anis/page/login/Dosen/feature_Input_Data/main_button.dart';
import 'package:absensi_anis/page/login/Dosen/feature_absensi/mainpage.dart';
import 'package:absensi_anis/page/ngrockdata.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'Dosen/feature_Jadwal/main_button.dart';

class Mahasiswa extends StatefulWidget {
  @override
  mahasiswa createState() => mahasiswa();
}

class Dosen extends StatefulWidget {
  @override
  dosen createState() => dosen();
}

class mahasiswa extends State<Mahasiswa> {
  String? id, name;
  readPreference() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var idSP = localStorage.getString('user_id');
    var nameSP = localStorage.getString('user');
    setState(() {
      id = idSP;
      name = nameSP;
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

  _logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    try {
      final res = await http.post(
        Uri.parse(ngrok_client().link + '/api/logout'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        _showMsg(data['msg']);
        localStorage.clear();
      } else {
        throw Exception(_showMsg("Terjadi Kesalahan"));
      }
    } catch (e) {
      _showMsg(e.toString());
    }
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => AuthPage()),
        (Route route) => false);
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
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: w * 1,
            height: h * 0.2,
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: w * 0.2,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: w * 0.05),
                  Container(
                    width: w * 0.6,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name.toString(),
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            id.toString(),
                            style: TextStyle(fontSize: 15),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: w * 1,
            height: h * 0.6,
            color: Colors.blue,
            child: Column(children: [
              Container(
                height: h * 0.05,
                color: Colors.green,
                child: Center(
                    child: Text(
                  "Hi! $name kamu sedang berada di dasboard E-Absens",
                )),
              ),
              SizedBox(height: h * 0.1),
              Container(
                width: w * 0.83,
                height: h * 0.35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: w * 0.3,
                          height: h * 0.15,
                          child: Card(
                            elevation: 4,
                          ),
                        ),
                        Container(
                          width: w * 0.3,
                          height: h * 0.15,
                          child: Card(
                            elevation: 4,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: w * 0.3,
                          height: h * 0.15,
                          child: Card(
                            elevation: 4,
                          ),
                        ),
                        Container(
                          width: w * 0.3,
                          height: h * 0.15,
                          child: Card(
                            elevation: 4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          Container(
            height: h * 0.05,
            child: Center(
                child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("Keluar"),
                          content: Text(
                              "Anda yakin ingin keluar, seluruh data lokal anda akan hilang"),
                          actions: [
                            TextButton(
                                child: Text('Ya'),
                                onPressed: () {
                                  _logout();
                                  Navigator.pop(context);
                                }),
                            TextButton(
                              child: Text('Tidak'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ));
              },
              child: Text("Mau Keluar?"),
            )),
          ),
        ],
      ),
    );
  }
}

class dosen extends State<Dosen> {
  String? keterangan, name;
  readPreference() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var idSP = localStorage.getString('user_id');
    var nameSP = localStorage.getString('user');
    setState(() {
      keterangan = idSP;
      name = nameSP;
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

  _logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    try {
      final res = await http.post(
        Uri.parse(ngrok_client().link + '/api/logout'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        _showMsg(data['msg']);
        localStorage.clear();
        localStorage.setString('msg', data['msg']);
      } else {
        throw Exception(_showMsg("Terjadi Kesalahan"));
      }
    } catch (e) {
      _showMsg(e.toString());
    }
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => AuthPage()),
        (Route route) => false);
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
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: w * 1,
            height: h * 0.2,
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: w * 0.2,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: w * 0.05),
                  Container(
                    width: w * 0.6,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name.toString(),
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            keterangan.toString(),
                            style: TextStyle(fontSize: 15),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: w * 1,
            height: h * 0.6,
            child: Column(children: [
              Container(
                height: h * 0.05,
                color: Colors.green,
                child: Center(
                    child: Text(
                  "Hi! $name kamu sedang berada di dasboard E-Absens",
                )),
              ),
              SizedBox(height: h * 0.1),
              Container(
                width: w * 0.83,
                height: h * 0.35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: w * 0.3,
                          height: h * 0.15,
                          child: Card(
                            elevation: 6,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Feature()),
                                );
                              },
                              child: Center(
                                child: Container(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.person_add,
                                      size: 70,
                                    ),
                                    Text("Input Data")
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: w * 0.3,
                          height: h * 0.15,
                          child: Card(
                            elevation: 6,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Schedule()),
                                );
                              },
                              child: Center(
                                child: Container(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      size: 70,
                                    ),
                                    Text("Jadwal")
                                  ],
                                )),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: w * 0.3,
                          height: h * 0.15,
                          child: Card(
                            elevation: 6,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Absen_Page()),
                                );
                              },
                              child: Center(
                                child: Container(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.how_to_reg,
                                      size: 70,
                                    ),
                                    Text("Cek Absensi")
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: w * 0.3,
                          height: h * 0.15,
                          child: Card(
                            elevation: 6,
                            child: InkWell(
                              onTap: () {},
                              child: Center(
                                child: Container(
                                    child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.download,
                                      size: 70,
                                    ),
                                    Text("Cetak Laporan")
                                  ],
                                )),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Container(
                height: h * 0.05,
                child: Center(
                    child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text("Keluar"),
                              content: Text(
                                  "Anda yakin ingin keluar, seluruh data lokal anda akan hilang"),
                              actions: [
                                TextButton(
                                    child: Text('Ya'),
                                    onPressed: () {
                                      _logout();
                                      Navigator.pop(context);
                                    }),
                                TextButton(
                                  child: Text('Tidak'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ));
                  },
                  child: Text("Mau Keluar?"),
                )),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
