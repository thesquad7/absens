import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../../header/settings/modelcofiig.dart';

class AddSmester extends StatefulWidget {
  @override
  addsmemster createState() => addsmemster();
}

class addsmemster extends State<AddSmester> {
  String? token;

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
        title: Text("Input Semester Kuliah Mahasiswa"),
      ),
      body: ListView(children: [
        Container(
          height: h * 0.18,
          child: Card(
            child: Column(children: [
              Container(
                  height: h * 0.05,
                  width: w * 1,
                  child: Text(
                    'Isi Informasi Semester',
                    style: TextStyle(fontSize: 20),
                  )),
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                  hintText: 'isi dengan angka',
                  labelText: 'Semester',
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.school),
                ),
              ),
              SizedBox(height: h * 0.02),
            ]),
            elevation: 10,
          ),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Simpan"))
      ]),
    );
  }
}
