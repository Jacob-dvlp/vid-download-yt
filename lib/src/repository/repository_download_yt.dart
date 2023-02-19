import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../helper/constant/app_constant.dart';
import '../model/response_download_yt.dart';
import 'interface/interface_download_yt.dart';

class RepositoryDownloadYt implements InterfaceDownloadYt {
  ResponseDownloadYt? responseDownloadYt;
  @override
  Future<ResponseDownloadYt> downloadVideoYt({String? url}) async {
    final response = await http.get(Uri.parse(
        "${AppConstant.baseUrlDownload}+https://www.youtube.com/watch?v=$url&type=360"));
    if (response.statusCode == 200) {
      debugPrint(response.body);
    }
    return responseDownloadYt!;
  }
}
