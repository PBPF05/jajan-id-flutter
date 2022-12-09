// To parse this JSON data, do
//
//     final channelData = channelDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ChannelData {
  ChannelData({
    required this.channels,
    required this.chatMessages,
  });

  List<Channel> channels;
  Map<String, String> chatMessages;

  factory ChannelData.fromRawJson(String str) =>
      ChannelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChannelData.fromJson(Map<String, dynamic> json) => ChannelData(
        channels: List<Channel>.from(
            json["channels"].map((x) => Channel.fromJson(x))),
        chatMessages: Map.from(json["chat_messages"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "channels": List<dynamic>.from(channels.map((x) => x.toJson())),
        "chat_messages": Map.from(chatMessages)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Channel {
  Channel(
      {required this.id,
      required this.toko,
      required this.user,
      required this.isToko});

  int id;
  Toko toko;
  User user;
  bool isToko;

  factory Channel.fromRawJson(String str) => Channel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        id: json["id"],
        toko: Toko.fromJson(json["toko"]),
        user: User.fromJson(json["user"]),
        isToko: json["is_toko"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "toko": toko.toJson(),
        "user": user.toJson(),
      };
}

class Toko {
  Toko({
    required this.nama,
    required this.kota,
    required this.provinsi,
    required this.lokasi,
    required this.deskripsi,
    required this.rangeHarga,
    required this.buka,
    required this.kondisi,
    required this.pemilik,
  });

  String nama;
  String kota;
  String provinsi;
  String lokasi;
  String deskripsi;
  String rangeHarga;
  bool buka;
  String kondisi;
  int pemilik;

  factory Toko.fromRawJson(String str) => Toko.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Toko.fromJson(Map<String, dynamic> json) => Toko(
        nama: json["nama"],
        kota: json["kota"],
        provinsi: json["provinsi"],
        lokasi: json["lokasi"],
        deskripsi: json["deskripsi"],
        rangeHarga: json["range_harga"],
        buka: json["buka"],
        kondisi: json["kondisi"],
        pemilik: json["pemilik"],
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
        "pemilik": pemilik,
      };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  int id;
  String username;
  String firstName;
  String lastName;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
      };
}

class ChatMessage {
  ChatMessage({
    required this.pesan,
    required this.pengirim,
    required this.channel,
    required this.pk,
  });

  int pk;
  String pesan;
  String pengirim;
  int channel;

  String toRawJson() => json.encode(toJson());

  factory ChatMessage.fromJson(int pk, Map<String, dynamic> json) =>
      ChatMessage(
        pesan: json["pesan"],
        pengirim: json["pengirim"],
        channel: json["channel"],
        pk: pk,
      );

  Map<String, dynamic> toJson() => {
        "pesan": pesan,
        "pengirim": pengirim,
        "channel": channel,
      };
}
