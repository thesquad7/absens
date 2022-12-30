import 'package:absensi_anis/page/login/Dosen/feature_Input_Data/Input_Data_Tabs/addmahasiswa.dart';
import 'package:absensi_anis/page/login/Dosen/feature_Input_Data/Input_Data_Tabs/addmatkul.dart';
import 'package:absensi_anis/page/login/Dosen/feature_Input_Data/Input_Data_Tabs/addsmester.dart';
import 'package:absensi_anis/page/login/Dosen/feature_Input_Data/Input_Data_Tabs/addtahun.dart';
import 'package:flutter/material.dart';

class Feature extends StatefulWidget {
  @override
  feature createState() => feature();
}

class feature extends State<Feature> {
  @override
  int _selectedIndex = 0;
  final _widgetOptions = [
    AddMahasiswa(),
    AddMatkul(),
    AddSmester(),
    AddTahun()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt),
            label: 'Mahasiswa',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Matkul',
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Semester',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'Tahun Ajar',
            backgroundColor: Colors.blueGrey,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.limeAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
