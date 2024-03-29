import 'dart:convert';

ResponseDownloadYt responseDownloadYtFromJson(String str) =>
    ResponseDownloadYt.fromJson(json.decode(str));

class ResponseDownloadYt {
  ResponseDownloadYt({
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

  ResponseDownloadYt copyWith({
    String? pilihanType,
    String? thumbnail,
    Mp4? mp4,
    Audio? audio,
  }) =>
      ResponseDownloadYt(
        pilihanType: pilihanType ?? this.pilihanType,
        mp4: mp4 ?? this.mp4,
        audio: audio ?? this.audio,
      );

  factory ResponseDownloadYt.fromJson(Map<String, dynamic> json) =>
      ResponseDownloadYt(
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
