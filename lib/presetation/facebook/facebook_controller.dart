import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../src/download_file.dart';
import '../../src/model/response_facebook.dart';
import '../../src/providers/interface_provider_get_video_yt/interface_facebook.dart';
import '../facebook_list_download/facebook_list_download_page.dart';

class FacebookController extends GetxController {
  ResponseFacebook? responseFacebook;
  final InterfaceProviderFacebook interfaceProviderFacebook;
  bool isLoading = true;
  String? arquivo;
  bool isBtnDownload = false;
  String? format;
  bool isSelectedItem = false;
  final TextEditingController searchText = TextEditingController(
      text: "https://www.facebook.com/watch?v=926466998530273");

  FacebookController(this.interfaceProviderFacebook);

  Future facebook() async {
    checkVideo(false);
    responseFacebook = await interfaceProviderFacebook
        .facebookdownload(url: searchText.text)
        .whenComplete(() {
      isSelectedBtn(true);
      Get.bottomSheet(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          const FacebookListDownloadPage());
      checkVideo(true);
    });
  }

  checkVideo(bool value) {
    isLoading = value;
    update();
  }

  isSelectedBtn(bool value) {
    isBtnDownload = value;
    update();
  }

  isSelected() {
    isSelectedItem = !isSelectedItem;
    update();
  }

  Future downloadFile() async {
    if (arquivo!.isEmpty) {
      return Get.snackbar("Baixar", "Seleciona alguma coisa para baixar",
          backgroundColor: Colors.red);
    } else {
      Directory directory = Directory(
        "storage/emulated/0/Download",
      );

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
        isSelectedBtn(false);
        await DownloadFile()
            .downloadFile(
                arquivo, format, responseFacebook!.hasil.title, directory.path)
            .whenComplete(() {
          isSelectedBtn(true);
          arquivo = "";
        });
      } else {
        isSelectedBtn(false);

        await DownloadFile()
            .downloadFile(
                arquivo, format, responseFacebook!.hasil.title, directory.path)
            .whenComplete(() {
          isSelectedBtn(true);
          arquivo = "";
        });
      }
    }
  }
}
