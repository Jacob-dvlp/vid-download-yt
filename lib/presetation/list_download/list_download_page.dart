import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom/custom_widget_list_download/custom_list_type_download.dart';
import '../video_you_tube/video_yt/video_yt_controller.dart';

class ListDownloadPage extends GetView<VideoYtController> {
  const ListDownloadPage({Key? key}) : super(key: key);
  static String routNamed = "/donwload_list";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoYtController>(
        init: VideoYtController(Get.find()),
        builder: (controller) {
          return SingleChildScrollView(
            //physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            imageUrl: controller.argument[2] ??
                                "https://i.ytimg.com/vi/iqLio3etKbo/default_controllerlive.jpg",
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                              backgroundColor: Colors.red,
                              color: Colors.white,
                            )),
                            errorWidget: (context, url, error) => const Padding(
                              padding: EdgeInsets.only(top: 5, left: 8),
                              child: Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            controller.argument[1],
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                textBaseline: TextBaseline.ideographic),
                          ),
                        ),
                      ],
                    ),
                    // const Divider(),
                    const SizedBox(
                      height: 4,
                    ),
                    const Divider(),
                    Row(
                      children: const [
                        Icon(
                          Icons.music_note_outlined,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Musica",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.isSelectedAudio();
                      },
                      child: CustomListTypeDownload(
                          type: "144k",
                          typesize: "     MP3",
                          size: controller.size!,
                          isSelected: controller.isAudioR),
                    ),

                    Row(
                      children: const [
                        Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.red,
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Vídeo",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    controller.downloadVideoYt1080P == null
                        ? Container()
                        : GestureDetector(
                            onTap: () {
                              controller.arquivo = controller
                                  .downloadVideoYt1080P!.mp4!.download;
                              controller.format = ".mp4";

                              controller.isSelected1();
                            },
                            child: CustomListTypeDownload(
                                type:
                                    "${controller.downloadVideoYt1080P!.mp4!.typeDownload}HD",
                                typesize: "Webm",
                                size:
                                    controller.downloadVideoYt1080P!.mp4!.size,
                                isSelected: controller.downloadVideoYt1080PR),
                          ),
                    controller.downloadVideoYt760P == null
                        ? Container()
                        : GestureDetector(
                            onTap: () {
                              controller.arquivo =
                                  controller.downloadVideoYt760P!.mp4!.download;
                              controller.format = ".mp4";

                              controller.isSelected2();
                            },
                            child: CustomListTypeDownload(
                                type:
                                    "${controller.downloadVideoYt760P!.mp4!.typeDownload}P",
                                typesize: "  Mp4",
                                size: controller.downloadVideoYt760P!.mp4!.size,
                                isSelected: controller.downloadVideoYt760PR),
                          ),
                    controller.downloadVideoYt420P == null
                        ? Container()
                        : GestureDetector(
                            onTap: () {
                              controller.arquivo =
                                  controller.downloadVideoYt420P!.mp4!.download;
                              controller.format = ".mp4";

                              controller.isSelected3();
                            },
                            child: CustomListTypeDownload(
                                type:
                                    "${controller.downloadVideoYt420P!.mp4!.typeDownload}P",
                                typesize: "Mp4",
                                size: controller.downloadVideoYt420P!.mp4!.size,
                                isSelected: controller.downloadVideoYt420PR),
                          ),
                    controller.downloadVideoYt360 == null
                        ? Container()
                        : GestureDetector(
                            onTap: () {
                              controller.arquivo =
                                  controller.downloadVideoYt360!.mp4!.download;
                              controller.format = ".mp4";

                              controller.isSelected4();
                            },
                            child: CustomListTypeDownload(
                              type:
                                  "${controller.downloadVideoYt360!.mp4!.typeDownload}P",
                              typesize: "Mp4",
                              size: controller.downloadVideoYt360!.mp4!.size,
                              isSelected: controller.downloadVideoYt360R,
                            ),
                          ),
                    controller.downloadVideoYt260 == null
                        ? Container()
                        : GestureDetector(
                            onTap: () {
                              controller.arquivo =
                                  controller.downloadVideoYt260!.mp4!.download;
                              controller.format = ".mp4";

                              controller.isSelected5();
                            },
                            child: CustomListTypeDownload(
                                type:
                                    "${controller.downloadVideoYt260!.mp4!.typeDownload}P",
                                typesize: "Mp4",
                                size: controller.downloadVideoYt260!.mp4!.size,
                                isSelected: controller.downloadVideoYt260R),
                          ),
                    controller.downloadVideoYt144P == null
                        ? Container()
                        : GestureDetector(
                            onTap: () {
                              controller.arquivo =
                                  controller.downloadVideoYt144P!.mp4!.download;
                              controller.format = ".mp4";
                              controller.isSelected6();
                            },
                            child: CustomListTypeDownload(
                              type:
                                  "${controller.downloadVideoYt144P!.mp4!.typeDownload}P",
                              typesize: "   Mp4",
                              size: controller.downloadVideoYt144P!.mp4!.size,
                              isSelected: controller.downloadVideoYt144PR,
                            ),
                          ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: controller.isBtnDownload
                                ? ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    onPressed: () {
                                      controller.downloadFile();
                                    },
                                    child: const Text(
                                      "Baixar",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ))
                                : const Center(
                                    child: CircularProgressIndicator(
                                    backgroundColor: Colors.red,
                                    color: Colors.white,
                                  ))))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
