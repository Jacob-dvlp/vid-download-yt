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
                    height: MediaQuery.of(context).size.height / 4.2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40, left: 8),
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
                                padding: EdgeInsets.only(top: 40, left: 8),
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
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const Flexible(
                                    child: Text("Download disponível")),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller.downloadVideo(
                                                    item.id.videoId);
                                                // showModalBottomSheet<void>(
                                                //   context: context,
                                                //   shape: RoundedRectangleBorder(
                                                //     borderRadius:
                                                //         BorderRadius.circular(
                                                //             20),
                                                //   ),
                                                //   builder:
                                                //       (BuildContext context) {
                                                //     return SizedBox(
                                                //       height: 2000,
                                                //       child: Padding(
                                                //         padding:
                                                //             const EdgeInsets
                                                //                 .all(8.0),
                                                //         child: Column(
                                                //           crossAxisAlignment:
                                                //               CrossAxisAlignment
                                                //                   .start,
                                                //           children: <Widget>[
                                                //             Text(
                                                //               item.snippet
                                                //                   .title,
                                                //               style:
                                                //                   const TextStyle(
                                                //                 fontSize: 15,
                                                //                 fontWeight:
                                                //                     FontWeight
                                                //                         .bold,
                                                //               ),
                                                //             ),
                                                //             const SizedBox(
                                                //               height: 10,
                                                //             ),
                                                //             SizedBox(
                                                //               width: Get.width,
                                                //               height: 250,
                                                //               child:
                                                //                   CachedNetworkImage(
                                                //                 imageUrl: item
                                                //                     .snippet
                                                //                     .thumbnails
                                                //                     .thumbnailsDefault
                                                //                     .url,
                                                //                 fit: BoxFit
                                                //                     .contain,
                                                //                 placeholder: (context,
                                                //                         url) =>
                                                //                     const Center(
                                                //                         child:
                                                //                             CircularProgressIndicator(
                                                //                   backgroundColor:
                                                //                       Colors
                                                //                           .red,
                                                //                   color: Colors
                                                //                       .white,
                                                //                 )),
                                                //                 errorWidget: (context,
                                                //                         url,
                                                //                         error) =>
                                                //                     const Padding(
                                                //                   padding: EdgeInsets
                                                //                       .only(
                                                //                           top:
                                                //                               40,
                                                //                           left:
                                                //                               8),
                                                //                   child: Icon(
                                                //                     Icons.error,
                                                //                     color: Colors
                                                //                         .red,
                                                //                   ),
                                                //                 ),
                                                //               ),
                                                //             ),
                                                //           ],
                                                //         ),
                                                //       ),
                                                //     );
                                                //   },
                                                // );
                                              },
                                              child: const Icon(
                                                Icons.download,
                                                color: Colors.red,
                                              ),
                                            ),
                                            const Text("MP4"),
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
                                    ),
                                  ));
                            },
                            child: const Icon(
                              Icons.play_circle_outline,
                              color: Colors.red,
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
