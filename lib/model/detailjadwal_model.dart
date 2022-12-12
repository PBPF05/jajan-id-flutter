// To parse required this JSON data, do
//
//     final detailJadwal = detailJadwalFromJson(jsonString);

import 'dart:convert';

List<DetailJadwal> detailJadwalFromJson(String str) => List<DetailJadwal>.from(json.decode(str).map((x) => DetailJadwal.fromJson(x)));

String detailJadwalToJson(List<DetailJadwal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailJadwal {
    DetailJadwal({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory DetailJadwal.fromJson(Map<String, dynamic> json) => DetailJadwal(
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
