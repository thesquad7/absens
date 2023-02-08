import 'dart:convert';
import 'package:absensi_anis/page/ngrockdata.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<MahasiswaData>> fetchtracking() async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var token = localStorage.getString('token');
  final res = await http.get(
    Uri.parse(ngrok_client().link + '/api/mahasiswa_data'),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );
  if (res.statusCode == 200) {
    List jsonResponse = json.decode(res.body);
    return jsonResponse.map((data) => MahasiswaData.fromJson(data)).toList();
  } else {
    throw Exception('Barang Kosong');
  }
}

MahasiswaData mahasiswaDataFromJson(String str) =>
    MahasiswaData.fromJson(json.decode(str));

String mahasiswaDataToJson(MahasiswaData data) => json.encode(data.toJson());

class MahasiswaData {
  MahasiswaData({
    required this.nim,
    required this.name,
    required this.kelas,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  String nim;
  String name;
  Kelas kelas;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory MahasiswaData.fromJson(Map<String, dynamic> json) => MahasiswaData(
        nim: json["nim"],
        name: json["name"],
        kelas: Kelas.fromJson(json["kelas"]),
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "nim": nim,
        "name": name,
        "kelas": kelas.toJson(),
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Kelas {
  Kelas({
    required this.id,
    required this.name,
    this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String name;
  dynamic rememberToken;
  DateTime createdAt;
  DateTime updatedAt;

  factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        id: json["id"],
        name: json["name"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
