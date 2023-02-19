import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/model/response_you_tube.dart';
import '../../src/providers/interface_provider_get_video_yt/interface_provider_download_yt.dart';
import '../../src/providers/interface_provider_get_video_yt/interface_provider_get_video_yt.dart';

class SheachedVideoController extends GetxController with StateMixin {
  final InterfaceProviderGetVideoYt interfaceProviderGetVideoYt;
  final InterfaceProviderDownloadYt interfaceProviderDownloadYt;

  final TextEditingController searchText = TextEditingController();
  List<Item> model = [];
  bool isLoading = true;
  bool isDownload = true;
  SheachedVideoController(
      this.interfaceProviderGetVideoYt, this.interfaceProviderDownloadYt);

  Future getVideoYT() async {
    if (searchText.text.isEmpty) {
      return Get.snackbar("Falha", "Campos de pesquisa  obrigátorio",
          backgroundColor: Colors.white,
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ));
    }
    checkVideo(false);
    try {
      model = await interfaceProviderGetVideoYt.searchVideoYt(searchText.text);
      change(Get.toNamed("/home"), status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error());
    }
    checkVideo(true);
  }

  Future downloadVideo(String url) async {
    checkDownload(false);
    await interfaceProviderDownloadYt.downloadVideoYt(url: url);
    checkDownload(true);
  }

  checkVideo(bool value) {
    isLoading = value;
    update();
  }

  checkDownload(bool value) {
    isDownload = value;
    update();
  }

  @override
  void dispose() {
    searchText.dispose();
    super.dispose();
  }
}
