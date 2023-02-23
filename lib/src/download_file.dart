import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

import 'notification/notification.dart';

class DownloadFile {
  Future<void> downloadFile(fileUrl, format, name, filePath) async {
    String fileName = name;
    await isFileDownloaded(fileName)
        ? OpenFile.open("$filePath/$fileName")
        : Dio().download(
            fileUrl,
            "$filePath/$fileName +$format",
            onReceiveProgress: (count, total) {
              downloadingNotification(total, count, false);
            },
          ).whenComplete(() {
            downloadingNotification(0, 0, true);
          });
  }

  Future<bool> isFileDownloaded(fileName) async {
    bool isDownloaded = false;

    var state = await Permission.manageExternalStorage.status;
    var state2 = await Permission.storage.status;

    if (!state2.isGranted) {
      await Permission.storage.request();
    }
    if (!state.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    List files = Directory("storage/emulated/0/Download").listSync();
    for (var file in files) {
      if (file.path == "storage/emulated/0/Download/$fileName") {
        isDownloaded = true;
      }
    }

    return isDownloaded;
  }
}
