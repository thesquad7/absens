import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../../header/settings/modelcofiig.dart';

class AddMatkul extends StatefulWidget {
  @override
  addmatkul createState() => addmatkul();
}

class addmatkul extends State<AddMatkul> {
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
        title: Text("Input Data Mata-Kuliah"),
      ),
      body: ListView(children: [
        Container(
          height: h * 0.28,
          child: Card(
            child: Column(children: [
              Container(
                  height: h * 0.05,
                  width: w * 1,
                  child: Text(
                    'Isi Informasi Mata Kuliah Anda',
                    style: TextStyle(fontSize: 20),
                  )),
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                  hintText: 'sesuaikan dengan RPS/SILABUS',
                  labelText: 'Judul Mata Kuliah',
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.book),
                ),
              ),
              SizedBox(height: h * 0.02),
              Container(
                height: h * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: _name,
                        decoration: const InputDecoration(
                          hintText: 'isi dengan angka',
                          labelText: 'Tahun Matakuliah',
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.timelapse),
                        ),
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _name,
                        decoration: const InputDecoration(
                          hintText: 'isi dengan angka',
                          labelText: 'Keterangan',
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.stacked_bar_chart),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
            elevation: 10,
          ),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Simpan"))
      ]),
    );
  }
}
