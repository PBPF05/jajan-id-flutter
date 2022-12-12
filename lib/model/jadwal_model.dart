// To parse this JSON data, do
//
//     final jadwalOperasi = jadwalOperasiFromJson(jsonString);

import 'dart:convert';

List<JadwalOperasi> jadwalOperasiFromJson(String str) => List<JadwalOperasi>.from(json.decode(str).map((x) => JadwalOperasi.fromJson(x)));

String jadwalOperasiToJson(List<JadwalOperasi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JadwalOperasi {
  JadwalOperasi({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory JadwalOperasi.fromJson(Map<String, dynamic> json) => JadwalOperasi(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.toko,
    required this.hari,
    required this.jamBuka,
    required this.jamTutup,
  });

  int toko;
  String hari;
  int jamBuka;
  int jamTutup;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    toko: json["toko"],
    hari: json["hari"],
    jamBuka: json["jam_buka"],
    jamTutup: json["jam_tutup"],
  );

  Map<String, dynamic> toJson() => {
    "toko": toko,
    "hari": hari,
    "jam_buka": jamBuka,
    "jam_tutup": jamTutup,
  };
}
