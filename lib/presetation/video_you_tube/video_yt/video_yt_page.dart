import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../list_download/list_download_page.dart';
import '../../sheached_video/sheached_video_controller.dart';
import 'video_yt_controller.dart';

class VideoYtPage extends StatefulWidget {
  const VideoYtPage({super.key});
  static String routNamed = "/video";

  @override
  State<VideoYtPage> createState() => _VideoYtPageState();
}

class _VideoYtPageState extends State<VideoYtPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoYtController>(
      init: VideoYtController(Get.find()),
      builder: (_) {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: GetBuilder<SheachedVideoController>(
                      builder: (controller) {
                    return CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          color: Colors.red,
                          onPressed: () {
                            _.checkDownload(true);
                            _.checkBtnDownload(true);
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios_outlined),
                        ));
                  }),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: _.isDownload
                      ? IconButton(
                          color: Colors.red,
                          onPressed: () {
                            if (_.downloadVideoYt1080P != null) {
                              _.size = _.downloadVideoYt1080P!.audio!.size;
                              _.arquivo = _.downloadVideoYt1080P!.audio!.audio;
                              _.format = ".mp3";
                            } else if (_.downloadVideoYt760P != null) {
                              _.size = _.downloadVideoYt760P!.audio!.size;
                              _.arquivo = _.downloadVideoYt760P!.audio!.audio;
                              _.format = ".mp3";
                            } else if (_.downloadVideoYt420P != null) {
                              _.size = _.downloadVideoYt420P!.audio!.size;
                              _.arquivo = _.downloadVideoYt420P!.audio!.audio;
                              _.format = ".mp3";
                            } else if (_.downloadVideoYt360 != null) {
                              _.size = _.downloadVideoYt360!.audio!.size;
                              _.arquivo = _.downloadVideoYt360!.audio!.audio;
                              _.format = ".mp3";
                            } else if (_.downloadVideoYt360 != null) {
                              _.size = _.downloadVideoYt360!.audio!.size;
                              _.arquivo = _.downloadVideoYt360!.audio!.audio;
                              _.format = ".mp3";
                            } else if (_.downloadVideoYt260 != null) {
                              _.size = _.downloadVideoYt260!.audio!.size;
                              _.arquivo = _.downloadVideoYt260!.audio!.audio;
                              _.format = ".mp3";
                            } else if (_.downloadVideoYt144P != null) {
                              _.size = _.downloadVideoYt144P!.audio!.size;
                              _.arquivo = _.downloadVideoYt144P!.audio!.audio;
                              _.format = ".mp3";
                            }
                            Get.bottomSheet(
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                const ListDownloadPage());
                          },
                          icon: const Icon(Icons.download),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.red,
                              color: Colors.white,
                            ),
                          ),
                        ),
                )
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.red,
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  color: const Color(0xFFF44336),
                  child: Image.asset(
                    "assets/bg.png",
                    color: Colors.white,
                  ),
                )),
          ),
        );
      },
    );
  }
}
