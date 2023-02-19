import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/model/response_you_tube.dart';
import '../sheached_video/sheached_video_controller.dart';
import '../video_you_tube/video_you_tube_page.dart';

class HomePage extends GetView<SheachedVideoController> {
  const HomePage({Key? key}) : super(key: key);
  static String routNamed = "/home";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SheachedVideoController>(
      init: SheachedVideoController(Get.find(), Get.find()),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('Resultado da Pesquisa'),
            centerTitle: true,
          ),
          body: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.model.length,
            itemBuilder: (context, index) {
              final Item item = controller.model[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 40,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 6,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 05, left: 8),
                          child: SizedBox(
                            child: CachedNetworkImage(
                              imageUrl:
                                  item.snippet.thumbnails.thumbnailsDefault.url,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                backgroundColor: Colors.red,
                                color: Colors.white,
                              )),
                              errorWidget: (context, url, error) =>
                                  const Padding(
                                padding: EdgeInsets.only(top: 5, left: 8),
                                child: Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    item.snippet.title,
                                    style: const TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Flexible(
                                  child: Text(
                                    item.snippet.channelTitle,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                    "Download disponível          (Mp4 & MP3)"),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VideoYouTubePage(
                                      id: item.id.videoId,
                                      descption: item.snippet.title,
                                      channelName: item.snippet.channelTitle,
                                      thumbnails: item.snippet.thumbnails
                                          .thumbnailsDefault.url,
                                    ),
                                  ));
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Icon(
                                Icons.play_circle_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
