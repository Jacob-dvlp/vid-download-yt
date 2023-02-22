import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../helper/constant/app_constant.dart';
import '../model/reponse_download2.dart';
import '../model/response_download3.dart';
import '../model/response_download4.dart';
import '../model/response_download5.dart';
import '../model/response_download6.dart';
import '../model/response_download_yt.dart';
import 'interface/interface_download_yt.dart';

class RepositoryDownloadYt implements InterfaceDownloadYt {
  @override
  Future<ResponseDownloadYt> downloadVideoYt1080p({String? url}) async {
    ResponseDownloadYt? responseDownloadYt1080p;

    final response = await http
        .get(Uri.parse(
            "${AppConstant.baseUrlDownload}+https://www.youtube.com/watch?v=$url&type=1080"))
        .timeout(const Duration(seconds: 20));
    log(response.body, name: "1080");
    if (response.statusCode == 200) {
      responseDownloadYt1080p = responseDownloadYtFromJson(response.body);
    }
    return responseDownloadYt1080p!;
  }

  @override
  Future<ResponseDownloadYt2> downloadVideoYt720p({String? url}) async {
    ResponseDownloadYt2? responseDownloadYt720p;

    final response = await http
        .get(Uri.parse(
            "${AppConstant.baseUrlDownload}+https://www.youtube.com/watch?v=$url&type=720"))
        .timeout(const Duration(seconds: 20));
    log(response.body, name: "720");
    if (response.statusCode == 200) {
      responseDownloadYt720p = responseDownloadYtFromJson2(response.body);
    }
    return responseDownloadYt720p!;
  }

  @override
  Future<ResponseDownloadYt3> downloadVideoYt480p({String? url}) async {
    ResponseDownloadYt3? responseDownloadYt480p;

    final response = await http
        .get(Uri.parse(
            "${AppConstant.baseUrlDownload}+https://www.youtube.com/watch?v=$url&type=480"))
        .timeout(const Duration(seconds: 20));
    log(response.body, name: "480");

    if (response.statusCode == 200) {
      responseDownloadYt480p = responseDownloadYtFromJson3(response.body);
    }
    return responseDownloadYt480p!;
  }

  @override
  Future<ResponseDownloadYt4> downloadVideoYt360p({String? url}) async {
    ResponseDownloadYt4? responseDownloadYt360p;

    final response = await http
        .get(Uri.parse(
            "${AppConstant.baseUrlDownload}+https://www.youtube.com/watch?v=$url&type=360"))
        .timeout(const Duration(seconds: 20));
    log(response.body, name: "360");

    if (response.statusCode == 200) {
      responseDownloadYt360p = responseDownloadYtFromJson4(response.body);
    }
    return responseDownloadYt360p!;
  }

  @override
  Future<ResponseDownloadYt5> downloadVideoYt240p({String? url}) async {
    ResponseDownloadYt5? responseDownloadYt240p;

    final response = await http
        .get(Uri.parse(
            "${AppConstant.baseUrlDownload}+https://www.youtube.com/watch?v=$url&type=240"))
        .timeout(const Duration(seconds: 20));
    log(response.body, name: "240");

    if (response.statusCode == 200) {
      responseDownloadYt240p = responseDownloadYtFromJson5(response.body);
    }
    return responseDownloadYt240p!;
  }

  @override
  Future<ResponseDownloadYt6> downloadVideoYt144p({String? url}) async {
    ResponseDownloadYt6? responseDownloadYt144p;

    final response = await http
        .get(Uri.parse(
            "${AppConstant.baseUrlDownload}+https://www.youtube.com/watch?v=$url&type=144"))
        .timeout(const Duration(seconds: 20));
    log(response.body, name: "144");
    if (response.statusCode == 200) {
      responseDownloadYt144p = responseDownloadYtFromJson6(response.body);
    }
    return responseDownloadYt144p!;
  }
}
