// To parse this JSON data, do
//
//     final responseYouTube = responseYouTubeFromJson(jsonString);

import 'dart:convert';

ResponseYouTube responseYouTubeFromJson(String str) =>
    ResponseYouTube.fromJson(json.decode(str));

class ResponseYouTube {
  ResponseYouTube({
    required this.kind,
    required this.etag,
    required this.nextPageToken,
    required this.regionCode,
    required this.pageInfo,
    required this.items,
  });

  String kind;
  String etag;
  String nextPageToken;
  String regionCode;
  PageInfo pageInfo;
  List<Item> items;

  factory ResponseYouTube.fromJson(Map<String, dynamic> json) =>
      ResponseYouTube(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        regionCode: json["regionCode"],
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );
}

class Item {
  Item({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  String kind;
  String etag;
  Id id;
  Snippet snippet;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: Id.fromJson(json["id"]),
        snippet: Snippet.fromJson(json["snippet"]),
      );
}

class Id {
  Id({
    required this.kind,
    required this.videoId,
  });

  String kind;
  String videoId;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        kind: json["kind"],
        videoId: json["videoId"],
      );
}

class Snippet {
  Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.liveBroadcastContent,
    required this.publishTime,
  });

  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  String liveBroadcastContent;
  DateTime publishTime;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        liveBroadcastContent: json["liveBroadcastContent"],
        publishTime: DateTime.parse(json["publishTime"]),
      );
}

class Thumbnails {
  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
  });

  Default thumbnailsDefault;
  Default medium;
  Default high;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
      );
}

class Default {
  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  String url;
  int width;
  int height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );
}

class PageInfo {
  PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  int totalResults;
  int resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );
}
