import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../helper/constant/app_constant.dart';
import '../model/response_download_yt.dart';
import 'interface/interface_download_yt.dart';

class RepositoryDownloadYt implements InterfaceDownloadYt {
  ResponseDownloadYt? responseDownloadYt1080p;
  ResponseDownloadYt? responseDownloadYt720p;
  ResponseDownloadYt? responseDownloadYt480p;

  @override
  Future<ResponseDownloadYt> downloadVideoYt1080p({String? url}) async {
    final response = await http
        .get(Uri.parse(
            "${AppConstant.baseUrlDownload}+https://www.youtube.com/watch?v=$url&type=1080"))
        .timeout(const Duration(seconds: 10));
    log(response.body, name: "1080");
    await downloadVideoYt480p(url: url);
    await downloadVideoYt720p(url: url);
    if (response.statusCode == 200) {
      responseDownloadYt1080p = responseDownloadYtFromJson(response.body);
    }
    return responseDownloadYt1080p!;
  }

  @override
  Future<ResponseDownloadYt> downloadVideoYt480p({String? url}) async {
    final response = await http
        .get(Uri.parse(
            "${AppConstant.baseUrlDownload}+https://www.youtube.com/watch?v=$url&type=480"))
        .timeout(const Duration(seconds: 10));
    log(response.body, name: "480");

    if (response.statusCode == 200) {
      responseDownloadYt480p = responseDownloadYtFromJson(response.body);
    }
    return responseDownloadYt480p!;
  }

  @override
  Future<ResponseDownloadYt> downloadVideoYt720p({String? url}) async {
    final response = await http
        .get(Uri.parse(
            "${AppConstant.baseUrlDownload}+https://www.youtube.com/watch?v=$url&type=720"))
        .timeout(const Duration(seconds: 10));
    log(response.body, name: "720");
    if (response.statusCode == 200) {
      responseDownloadYt720p = responseDownloadYtFromJson(response.body);
    }
    return responseDownloadYt720p!;
  }
}
