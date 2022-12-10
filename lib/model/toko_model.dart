// To parse this JSON data, do
//
//     final toko = tokoFromJson(jsonString);

import 'dart:convert';

List<Toko> tokoFromJson(String str) => List<Toko>.from(json.decode(str).map((x) => Toko.fromJson(x)));

String tokoToJson(List<Toko> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Toko {
  Toko({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Toko.fromJson(Map<String, dynamic> json) => Toko(
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
    required this.nama,
    required this.kota,
    required this.provinsi,
    required this.lokasi,
    required this.deskripsi,
    required this.rangeHarga,
    required this.buka,
    required this.kondisi,
  });

  String nama;
  String kota;
  String provinsi;
  String lokasi;
  String deskripsi;
  String rangeHarga;
  bool buka;
  String kondisi;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    nama: json["nama"],
    kota: json["kota"],
    provinsi: json["provinsi"],
    lokasi: json["lokasi"],
    deskripsi: json["deskripsi"],
    rangeHarga: json["range_harga"],
    buka: json["buka"],
    kondisi: json["kondisi"],
  );

  Map<String, dynamic> toJson() => {
    "nama": nama,
    "kota": kota,
    "provinsi": provinsi,
    "lokasi": lokasi,
    "deskripsi": deskripsi,
    "range_harga": rangeHarga,
    "buka": buka,
    "kondisi": kondisi,
  };
}
