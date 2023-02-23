import 'dart:convert';

ResponseFacebook responseFacebookFromJson(String str) =>
    ResponseFacebook.fromJson(json.decode(str));

class ResponseFacebook {
  ResponseFacebook({
    required this.hasil,
  });

  Facebook hasil;

  factory ResponseFacebook.fromJson(Map<String, dynamic> json) =>
      ResponseFacebook(
        hasil: Facebook.fromJson(json["hasil"]),
      );
}

class Facebook {
  Facebook({
    required this.url,
    required this.title,
    required this.time,
    required this.hd,
    required this.sd,
    required this.audio,
  });

  String url;
  String title;
  String time;
  String hd;
  String sd;
  String audio;

  factory Facebook.fromJson(Map<String, dynamic> json) => Facebook(
        url: json["url"],
        title: json["title"],
        time: json["time"],
        hd: json["hd"],
        sd: json["sd"],
        audio: json["audio"],
      );
}
