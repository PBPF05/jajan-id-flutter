// To parse this JSON data, do
//
//     final detailBarang = detailBarangFromJson(jsonString);

import 'dart:convert';

List<DetailBarang> detailBarangFromJson(String str) => List<DetailBarang>.from(json.decode(str).map((x) => DetailBarang.fromJson(x)));

String detailBarangToJson(List<DetailBarang> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailBarang {
    DetailBarang({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory DetailBarang.fromJson(Map<String, dynamic> json) => DetailBarang(
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
        required this.toko,
        required this.harga,
        required this.deskripsi,
        required this.jenis,
    });

    String nama;
    int toko;
    int harga;
    String deskripsi;
    String jenis;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        nama: json["nama"],
        toko: json["toko"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        jenis: json["jenis"],
    );

    Map<String, dynamic> toJson() => {
        "nama": nama,
        "toko": toko,
        "harga": harga,
        "deskripsi": deskripsi,
        "jenis": jenis,
    };
}
