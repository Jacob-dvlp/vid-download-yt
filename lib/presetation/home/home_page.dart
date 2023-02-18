import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/model/response_you_tube.dart';
import '../sheached_video/sheached_video_controller.dart';

class HomePage extends GetView<SheachedVideoController> {
  const HomePage({Key? key}) : super(key: key);
  static String routNamed = "/home";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SheachedVideoController>(
      init: SheachedVideoController(Get.find()),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('Vidéos'),
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
                    height: MediaQuery.of(context).size.height / 5,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            child: CachedNetworkImage(
                              imageUrl:
                                  item.snippet.thumbnails.thumbnailsDefault.url,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
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
                                Text(
                                  item.snippet.title,
                                  style: const TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  item.snippet.channelTitle,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("Download disponível"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.download,
                                              color: Colors.red,
                                            ),
                                            Text("MP4"),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.download,
                                            color: Colors.red,
                                          ),
                                          Text("MP3"),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                              width: 52,
                                              child: LinearProgressIndicator(
                                                color: Colors.red,
                                                backgroundColor: Colors.white,
                                                value: 5,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, right: 8),
                          child: Icon(
                            Icons.visibility_outlined,
                            color: Colors.red,
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
