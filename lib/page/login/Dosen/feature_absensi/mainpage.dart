import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:absensi_anis/endpoint/http.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Absen_Page extends StatefulWidget {
  @override
  absen createState() => absen();
}

class absen extends State<Absen_Page> {
  late Future<List<MahasiswaData>> details;
  String userid = "";

  @override
  void initState() {
    super.initState();
    details = fetchtracking();
    readPreferences();
  }

  void readPreferences() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    //var id_pengguna = localStorage.getString('id');
    setState(() {
      //userid = id_pengguna!;
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Tracking"),
      ),
      body: Center(
        child: FutureBuilder<List<MahasiswaData>>(
            future: details,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == ['']) {
                  return Center(child: Text("Belum ada Aktivitas"));
                } else {
                  List<MahasiswaData>? details = snapshot.data;
                  return ListView.builder(
                      itemCount: details!.length,
                      itemBuilder: (BuildContext context, index) {
                        final detail = details[index];
                        return Card(
                          margin: EdgeInsets.all(5),
                          elevation: 5,
                          child: InkWell(
                            onTap: () async {
                              if (userid.length > 8) {
                                SharedPreferences localStorage =
                                    await SharedPreferences.getInstance();
                                localStorage.setString(
                                    "MahasiswaM", detail.name);
                                var token =
                                    localStorage.getString('access_token');
                                var userkey = localStorage.getString('userKey');
                                try {
                                  final res = await http.get(
                                    Uri.parse(
                                        'http://silk.polindra.ac.id/api/detailP/' +
                                            detail.kelas.id),
                                    headers: {
                                      'Authorization': 'Bearer $token',
                                    },
                                  );
                                  if (res.statusCode == 200) {
                                    var data = json.decode(res.body);
                                    localStorage.setString(
                                        "idbarang", data['barang_id']);
                                    localStorage.setString(
                                        "jumlah", data['jumlah'].toString());
                                    localStorage.setString(
                                        'statusB', detail.nim);
                                  } else {
                                    return _showMsg("Identitias Kosong");
                                  }
                                } on SocketException {
                                  _showMsg("Terjadi Kesalahan System");
                                } on FormatException {
                                  _showMsg("A");
                                } catch (e) {
                                  _showMsg(e.toString());
                                }
                              } else {
                                SharedPreferences localStorage =
                                    await SharedPreferences.getInstance();
                                //localStorage.setString("dosenN", detail.dosen);
                                var token =
                                    localStorage.getString('access_token');
                                var userkey = localStorage.getString('userKey');
                                try {
                                  final res = await http.get(
                                    Uri.parse(
                                        'http://silk.polindra.ac.id/api/detailP/' +
                                            detail.kelas.id),
                                    headers: {
                                      'Authorization': 'Bearer $token',
                                    },
                                  );
                                  if (res.statusCode == 200) {
                                    var data = json.decode(res.body);
                                    localStorage.setString(
                                        "idbarang", data['barang_id']);
                                    localStorage.setString(
                                        "jumlah", data['jumlah'].toString());
                                    //localStorage.setString(
                                    //  'statusB', detail.status);
                                  } else {
                                    return _showMsg("Identitias Kosong");
                                  }
                                } on SocketException {
                                  _showMsg("Terjadi Kesalahan System");
                                } on FormatException {
                                  _showMsg("A");
                                } catch (e) {
                                  _showMsg(e.toString());
                                }
                                ;
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        child: Icon(Icons.book),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(detail.kelas.id,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(detail.name),
                                        ],
                                      ),
                                      Container(child: LayoutBuilder(
                                          builder: (context, constraints) {
                                        if (true == "Ya") {
                                          return Icon(
                                            Icons.verified,
                                            color: Colors.green,
                                          );
                                        } else {
                                          return Icon(
                                            Icons.autorenew,
                                            color: Colors.red,
                                          );
                                        }
                                      }))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
              } else if (snapshot.hasError) {
                return Center(child: Text("Harap Hubungkan Koneksi"));
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
