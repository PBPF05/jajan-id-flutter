// To parse this JSON data, do
//
//     final dataKatalog = dataKatalogFromJson(jsonString);

import 'dart:convert';

List<DataKatalog> dataKatalogFromJson(String str) => List<DataKatalog>.from(json.decode(str).map((x) => DataKatalog.fromJson(x)));

String dataKatalogToJson(List<DataKatalog> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataKatalog {
    DataKatalog({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory DataKatalog.fromJson(Map<String, dynamic> json) => DataKatalog(
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
