import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../src/download_file.dart';
import '../../../src/model/reponse_download2.dart';
import '../../../src/model/response_download3.dart';
import '../../../src/model/response_download4.dart';
import '../../../src/model/response_download5.dart';
import '../../../src/model/response_download6.dart';
import '../../../src/model/response_download_yt.dart';
import '../../../src/providers/interface_provider_get_video_yt/interface_provider_download_yt.dart';

class VideoYtController extends GetxController {
  final InterfaceProviderDownloadYt interfaceProviderDownloadYt;
  ResponseDownloadYt? downloadVideoYt1080P;
  ResponseDownloadYt2? downloadVideoYt760P;
  ResponseDownloadYt3? downloadVideoYt420P;
  ResponseDownloadYt4? downloadVideoYt360;
  ResponseDownloadYt5? downloadVideoYt260;
  ResponseDownloadYt6? downloadVideoYt144P;
  String? size;
  String? arquivo;
  String? format;
  String? name;
  bool isBtnDownload = true;

  bool isDownload = true;
  bool downloadVideoYt1080PR = false;
  bool downloadVideoYt760PR = false;
  bool downloadVideoYt420PR = false;
  bool downloadVideoYt360R = false;
  bool downloadVideoYt260R = false;
  bool downloadVideoYt144PR = false;
  bool isAudioR = false;
  isSelectedAudio() {
    downloadVideoYt1080PR = false;
    downloadVideoYt760PR = false;
    downloadVideoYt420PR = false;
    downloadVideoYt360R = false;
    downloadVideoYt260R = false;
    downloadVideoYt144PR = false;
    isAudioR = true;
    debugPrint(arquivo);

    update();
  }

  isSelected1() {
    downloadVideoYt1080PR = true;
    downloadVideoYt760PR = false;
    downloadVideoYt420PR = false;
    downloadVideoYt360R = false;
    downloadVideoYt260R = false;
    downloadVideoYt144PR = false;
    isAudioR = false;
    debugPrint(arquivo);

    update();
  }

  isSelected2() {
    downloadVideoYt1080PR = false;
    downloadVideoYt760PR = true;
    downloadVideoYt420PR = false;
    downloadVideoYt360R = false;
    downloadVideoYt260R = false;
    downloadVideoYt144PR = false;
    isAudioR = false;
    debugPrint(arquivo);

    update();
  }

  isSelected3() {
    downloadVideoYt1080PR = false;
    downloadVideoYt760PR = false;
    downloadVideoYt420PR = true;
    downloadVideoYt360R = false;
    downloadVideoYt260R = false;
    downloadVideoYt144PR = false;
    isAudioR = false;
    debugPrint(arquivo);

    update();
  }

  isSelected4() {
    downloadVideoYt1080PR = false;
    downloadVideoYt760PR = false;
    downloadVideoYt420PR = false;
    downloadVideoYt360R = true;
    downloadVideoYt260R = false;
    downloadVideoYt144PR = false;
    isAudioR = false;
    debugPrint(arquivo);

    update();
  }

  isSelected5() {
    downloadVideoYt1080PR = false;
    downloadVideoYt760PR = false;
    downloadVideoYt420PR = false;
    downloadVideoYt360R = false;
    downloadVideoYt260R = true;
    downloadVideoYt144PR = false;
    isAudioR = false;
    debugPrint(arquivo);

    update();
  }

  isSelected6() {
    downloadVideoYt1080PR = false;
    downloadVideoYt760PR = false;
    downloadVideoYt420PR = false;
    downloadVideoYt360R = false;
    downloadVideoYt260R = false;
    downloadVideoYt144PR = true;
    isAudioR = false;
    debugPrint(arquivo);

    update();
  }

  final argument = Get.arguments;

  VideoYtController(this.interfaceProviderDownloadYt);

  Future downloadFile() async {
    if (arquivo! == "") {
      return Get.snackbar("Baixar", "Seleciona alguma coisa para baixar");
    } else {
      Directory directory = Directory("storage/emulated/0/Download");

      if (!await directory.exists()) {
        var state = await Permission.manageExternalStorage.status;
        var state2 = await Permission.storage.status;

        if (!state2.isGranted) {
          await Permission.storage.request();
        }
        if (!state.isGranted) {
          await Permission.manageExternalStorage.request();
        }
        await directory.create();
        checkBtnDownload(false);
        await DownloadFile()
            .downloadFile(arquivo, format, argument[1], directory.path)
            .whenComplete(() {
          checkBtnDownload(true);
        });
      } else {
        checkBtnDownload(false);

        await DownloadFile()
            .downloadFile(arquivo, format, argument[1], directory.path)
            .whenComplete(() {
          checkBtnDownload(true);
        });
      }
    }
  }

  checkBtnDownload(bool value) {
    isBtnDownload = value;
    update();
  }

  Future downloadVideoYt1() async {
    String url = argument[0];

    EasyLoading.show(
        status: 'Estamos preparando o seu download...',
        maskType: EasyLoadingMaskType.black);
    checkDownload(false);

    downloadVideoYt1080P = await interfaceProviderDownloadYt
        .downloadVideoYt1080p(url: url)
        .whenComplete(() async {
          checkDownload(true);
          downloadVideoYt760P =
              await interfaceProviderDownloadYt.downloadVideoYt720p(url: url);
          checkDownload(true);
          EasyLoading.showSuccess(
            "O seu download está disponivel",
          );
        })
        .whenComplete(() async => downloadVideoYt420P =
            await interfaceProviderDownloadYt
                .downloadVideoYt480p(url: url)
                .whenComplete(() => checkDownload(true)))
        .whenComplete(() async => downloadVideoYt360 =
            await interfaceProviderDownloadYt
                .downloadVideoYt360p(url: url)
                .whenComplete(() => checkDownload(true)))
        .whenComplete(() async => downloadVideoYt260 =
            await interfaceProviderDownloadYt
                .downloadVideoYt240p(url: url)
                .whenComplete(() => checkDownload(true)))
        .whenComplete(() async => downloadVideoYt144P =
            await interfaceProviderDownloadYt
                .downloadVideoYt144p(url: url)
                .whenComplete(() => checkDownload(true)));
  }

  checkDownload(bool value) {
    isDownload = value;
    update();
  }

  @override
  void onInit() {
    downloadVideoYt1();
    // print(argument[2]);

    super.onInit();
  }
}
