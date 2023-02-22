import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../custom/custom_widget_list_download/custom_list_type_download.dart';
import '../../sheached_video/sheached_video_controller.dart';
import 'video_yt_controller.dart';

class VideoYtPage extends GetView<VideoYtController> {
  const VideoYtPage({super.key});
  static String routNamed = "/video";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoYtController>(
      init: VideoYtController(Get.find()),
      builder: (_) {
        return YoutubePlayerBuilder(
          player: YoutubePlayer(controller: _.controller),
          builder: (context, player) {
            return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
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
                            backgroundColor: Colors.red,
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                _.checkDownload(true);
                                Get.back();
                              },
                              icon: const Icon(Icons.arrow_back_ios_outlined),
                            ));
                      }),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      child: _.isDownload
                          ? IconButton(
                              color: Colors.white,
                              onPressed: () {
                                if (_.downloadVideoYt1080P != null) {
                                  _.size = _.downloadVideoYt1080P!.audio!.size;
                                  _.audio =
                                      _.downloadVideoYt1080P!.audio!.audio;
                                } else if (_.downloadVideoYt760P != null) {
                                  _.size = _.downloadVideoYt760P!.audio!.size;
                                  _.audio = _.downloadVideoYt760P!.audio!.audio;
                                } else if (_.downloadVideoYt420P != null) {
                                  _.size = _.downloadVideoYt420P!.audio!.size;
                                  _.audio = _.downloadVideoYt420P!.audio!.audio;
                                } else if (_.downloadVideoYt360 != null) {
                                  _.size = _.downloadVideoYt360!.audio!.size;
                                  _.audio = _.downloadVideoYt360!.audio!.audio;
                                } else if (_.downloadVideoYt360 != null) {
                                  _.size = _.downloadVideoYt360!.audio!.size;
                                  _.audio = _.downloadVideoYt360!.audio!.audio;
                                } else if (_.downloadVideoYt260 != null) {
                                  _.size = _.downloadVideoYt260!.audio!.size;
                                  _.audio = _.downloadVideoYt260!.audio!.audio;
                                } else if (_.downloadVideoYt144P != null) {
                                  _.size = _.downloadVideoYt144P!.audio!.size;
                                  _.audio = _.downloadVideoYt144P!.audio!.audio;
                                }

                                Get.bottomSheet(
                                    backgroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      imageUrl: _.argument[2] ??
                                                          "https://i.ytimg.com/vi/iqLio3etKbo/default_live.jpg",
                                                      placeholder: (context,
                                                              url) =>
                                                          const Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                        backgroundColor:
                                                            Colors.red,
                                                        color: Colors.white,
                                                      )),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 5,
                                                                left: 8),
                                                        child: Icon(
                                                          Icons.error,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      _.argument[1],
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          textBaseline:
                                                              TextBaseline
                                                                  .ideographic),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Divider(),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: const [
                                                  Icon(
                                                    Icons.music_note_outlined,
                                                    color: Colors.red,
                                                    size: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Musica",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              CustomListTypeDownload(
                                                  type: "144k",
                                                  typesize: "     MP3",
                                                  size: _.size!),
                                              const Divider(),
                                              Row(
                                                children: const [
                                                  Icon(
                                                    Icons.play_arrow_outlined,
                                                    color: Colors.red,
                                                    size: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Vídeo",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              _.downloadVideoYt1080P == null
                                                  ? Container()
                                                  : CustomListTypeDownload(
                                                      type:
                                                          "${_.downloadVideoYt1080P!.mp4!.typeDownload}HD",
                                                      typesize: "Webm",
                                                      size: _
                                                          .downloadVideoYt1080P!
                                                          .mp4!
                                                          .size),
                                              _.downloadVideoYt760P == null
                                                  ? Container()
                                                  : CustomListTypeDownload(
                                                      type:
                                                          "${_.downloadVideoYt760P!.mp4!.typeDownload}P",
                                                      typesize: "  Mp4",
                                                      size: _
                                                          .downloadVideoYt760P!
                                                          .mp4!
                                                          .size),
                                              _.downloadVideoYt420P == null
                                                  ? Container()
                                                  : CustomListTypeDownload(
                                                      type:
                                                          "${_.downloadVideoYt420P!.mp4!.typeDownload}P",
                                                      typesize: "Mp4",
                                                      size: _
                                                          .downloadVideoYt420P!
                                                          .mp4!
                                                          .size),
                                              _.downloadVideoYt360 == null
                                                  ? Container()
                                                  : CustomListTypeDownload(
                                                      type:
                                                          "${_.downloadVideoYt360!.mp4!.typeDownload}P",
                                                      typesize: "Mp4",
                                                      size: _
                                                          .downloadVideoYt360!
                                                          .mp4!
                                                          .size),
                                              _.downloadVideoYt260 == null
                                                  ? Container()
                                                  : CustomListTypeDownload(
                                                      type:
                                                          "${_.downloadVideoYt260!.mp4!.typeDownload}P",
                                                      typesize: "Mp4",
                                                      size: _
                                                          .downloadVideoYt260!
                                                          .mp4!
                                                          .size),
                                              _.downloadVideoYt144P == null
                                                  ? Container()
                                                  : CustomListTypeDownload(
                                                      type:
                                                          "${_.downloadVideoYt144P!.mp4!.typeDownload}P",
                                                      typesize: "   Mp4",
                                                      size: _
                                                          .downloadVideoYt144P!
                                                          .mp4!
                                                          .size),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 40,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.red),
                                                    onPressed: () {},
                                                    child: const Text(
                                                      "Download",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17),
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 400, child: player),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: 250,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red, elevation: 20),
                            onPressed: () {
                              _.change();
                            },
                            child: Text(_.controller.value.isPlaying
                                ? "Play"
                                : "Pause"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
