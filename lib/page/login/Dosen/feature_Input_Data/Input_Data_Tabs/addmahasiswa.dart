import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../../header/settings/modelcofiig.dart';
import '../../../../ngrockdata.dart';

class AddMahasiswa extends StatefulWidget {
  @override
  addmahasiswa createState() => addmahasiswa();
}

class addmahasiswa extends State<AddMahasiswa> {
  String? tahun, matkul, semester, token, kelas;
  String? tahunname, matkulname, semestername, kelasname;
  late TextEditingController? _name;
  readPreference() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var stateSP = localStorage.getString('token');
    setState(() {
      token = stateSP;
    });
  }

  @override
  void initState() {
    super.initState();
    readPreference();
    _name = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Input Data Mahasiswa"),
      ),
      body: ListView(children: [
        Container(
          height: h * 0.1,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Container(
                    width: w * 1, child: Text("Memiliki Data Berupa Excel?")),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: w * 0.4,
                    height: h * 0.05,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                        ),
                        onPressed: () {},
                        child: Text("Petunjuk")),
                  ),
                  Container(
                    width: w * 0.4,
                    height: h * 0.05,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: () {},
                        child: Text("Import File")),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          height: h * 0.48,
          child: Card(
            child: Column(children: [
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
                controller: _name,
                decoration: const InputDecoration(
                  hintText: 'menyesuaikan dengan RistekDikti?',
                  labelText: 'Nomor Induk Mahasiswa',
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.shield),
                ),
              ),
              SizedBox(height: h * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: w * 0.015,
                    child: Icon(
                      Icons.sunny,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: h * 0.082,
                    width: w * 0.878,
                    child: ListView(children: [
                      DropdownSearch<Dropdown>(
                        mode: Mode.MENU,
                        onChanged: (value) {
                          tahun = value?.id;
                          tahunname = value?.name;
                        },
                        dropdownBuilder: (context, selectedItem) =>
                            Text(selectedItem?.name ?? "Pilih Tahun Ajar"),
                        popupItemBuilder: (context, item, isSelected) =>
                            ListTile(
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
                ],
              ),
              SizedBox(height: h * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: w * 0.015,
                    child: Icon(
                      Icons.room,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: h * 0.082,
                    width: w * 0.878,
                    child: ListView(children: [
                      DropdownSearch<Dropdown>(
                        mode: Mode.MENU,
                        onChanged: (value) {
                          kelas = value?.id;
                          kelasname = value?.name;
                        },
                        dropdownBuilder: (context, selectedItem) =>
                            Text(selectedItem?.name ?? "Pilih Kelas saat Ini"),
                        popupItemBuilder: (context, item, isSelected) =>
                            ListTile(
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
                ],
              ),
              SizedBox(height: h * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: w * 0.015,
                    child: Icon(
                      Icons.school,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: h * 0.082,
                    width: w * 0.878,
                    child: ListView(children: [
                      DropdownSearch<Dropdown>(
                        mode: Mode.MENU,
                        onChanged: (value) {
                          semester = value?.id;
                          semestername = value?.name;
                        },
                        dropdownBuilder: (context, selectedItem) => Text(
                            selectedItem?.name ?? "Pilih semester saat ini"),
                        popupItemBuilder: (context, item, isSelected) =>
                            ListTile(
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
                ],
              ),
            ]),
            elevation: 10,
          ),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Simpan"))
      ]),
    );
  }
}
