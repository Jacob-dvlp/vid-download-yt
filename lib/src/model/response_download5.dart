import 'dart:convert';

ResponseDownloadYt5 responseDownloadYtFromJson5(String str) =>
    ResponseDownloadYt5.fromJson(json.decode(str));

class ResponseDownloadYt5 {
  ResponseDownloadYt5({
    this.creator,
    this.pilihanType,
    this.id,
    this.thumbnail,
    this.title,
    this.mp4,
    this.audio,
  });

  String? creator;
  String? pilihanType;
  String? id;
  String? thumbnail;
  String? title;
  Mp4? mp4;
  Audio? audio;

  factory ResponseDownloadYt5.fromJson(Map<String, dynamic> json) =>
      ResponseDownloadYt5(
        creator: json["creator"],
        pilihanType: json["pilihan_type"],
        id: json["id"],
        thumbnail: json["thumbnail"],
        title: json["title"],
        mp4: Mp4.fromJson(json["mp4"]),
        audio: Audio.fromJson(json["audio"]),
      );
}

class Audio {
  Audio({
    required this.audio,
    required this.size,
  });

  String audio;
  String size;

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        audio: json["audio"],
        size: json["size"],
      );
}

class Mp4 {
  Mp4({
    required this.download,
    required this.size,
    required this.typeDownload,
  });

  String download;
  String size;
  String typeDownload;

  factory Mp4.fromJson(Map<String, dynamic> json) => Mp4(
        download: json["download"],
        size: json["size"],
        typeDownload: json["type_download"],
      );
}
