import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../src/model/reponse_download2.dart';
import '../../../src/model/response_download3.dart';
import '../../../src/model/response_download4.dart';
import '../../../src/model/response_download5.dart';
import '../../../src/model/response_download6.dart';
import '../../../src/model/response_download_yt.dart';
import '../../../src/providers/interface_provider_get_video_yt/interface_provider_download_yt.dart';

class VideoYtController extends GetxController {
  late YoutubePlayerController controller;
  final InterfaceProviderDownloadYt interfaceProviderDownloadYt;
  ResponseDownloadYt? downloadVideoYt1080P;
  ResponseDownloadYt2? downloadVideoYt760P;
  ResponseDownloadYt3? downloadVideoYt420P;
  ResponseDownloadYt4? downloadVideoYt360;
  ResponseDownloadYt5? downloadVideoYt260;
  ResponseDownloadYt6? downloadVideoYt144P;
  String? size;
  String? audio;

  bool isDownload = true;

  final argument = Get.arguments;

  VideoYtController(this.interfaceProviderDownloadYt);

  change() {
    if (controller.value.isPlaying) {
      controller.pause();
      update();
    } else {
      controller.play();
      update();
    }
  }

  Future downloadVideoYt1() async {
    String url = argument[0];
    checkDownload(false);
    downloadVideoYt1080P = await interfaceProviderDownloadYt
        .downloadVideoYt1080p(url: url)
        .whenComplete(() async {
          downloadVideoYt760P =
              await interfaceProviderDownloadYt.downloadVideoYt720p(url: url);
        })
        .whenComplete(() async => downloadVideoYt420P =
            await interfaceProviderDownloadYt.downloadVideoYt480p(url: url))
        .whenComplete(() async => downloadVideoYt360 =
            await interfaceProviderDownloadYt.downloadVideoYt360p(url: url))
        .whenComplete(() async => downloadVideoYt260 =
            await interfaceProviderDownloadYt.downloadVideoYt240p(url: url))
        .whenComplete(() async => downloadVideoYt144P =
            await interfaceProviderDownloadYt.downloadVideoYt144p(url: url));
    checkDownload(true);
  }

  checkDownload(bool value) {
    isDownload = value;
    update();
  }

  @override
  void onInit() {
    downloadVideoYt1();
   // print(argument[2]);
    controller = YoutubePlayerController(initialVideoId: argument[0]);

    super.onInit();
  }

  @override
  void onClose() {
    controller.pause();
    super.onClose();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
