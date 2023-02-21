import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../custom/custom_widget_list_download/custom_list_type_download.dart';
import '../sheached_video/sheached_video_controller.dart';

class VideoYouTubePage extends StatefulWidget {
  final String? id;
  final String? descption;
  final String? thumbnails;
  final String? channelName;
  const VideoYouTubePage(
      {super.key, this.id, this.descption, this.channelName, this.thumbnails});

  @override
  State<VideoYouTubePage> createState() => _VideoYouTubePageState();
}

class _VideoYouTubePageState extends State<VideoYouTubePage> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    controller = YoutubePlayerController(initialVideoId: widget.id!);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
        progressIndicatorColor: Colors.red,
      ),
      builder: (context, player) {
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
                        backgroundColor: Colors.red,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            controller.checkDownload(true);
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_outlined),
                        ));
                  }),
                ),
                GetBuilder<SheachedVideoController>(
                  init: SheachedVideoController(Get.find(), Get.find()),
                  builder: (controller) {
                    return CircleAvatar(
                      backgroundColor: Colors.red,
                      child: controller.isDownload
                          ? IconButton(
                              color: Colors.white,
                              onPressed: () {
                               controller
                                  .downloadVideo(widget.id!)
                                    .whenComplete(
                                   () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return SingleChildScrollView(
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
                                                      imageUrl:
                                                          widget.thumbnails!,
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
                                                      widget.descption!,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: const TextStyle(
                                                          fontSize: 14,
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
                                              const CustomListTypeDownload(
                                                  type: "128k",
                                                  typesize: "MP3",
                                                  size: "45Mb"),
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
                                              const CustomListTypeDownload(
                                                  type: "1080HD",
                                                  typesize: "Webm",
                                                  size: "200Mb"),
                                              const CustomListTypeDownload(
                                                  type: "720P",
                                                  typesize: "  Mp4",
                                                  size: "150Mb"),
                                              const CustomListTypeDownload(
                                                  type: "420P",
                                                  typesize: "Mp4",
                                                  size: "60Mb"),
                                              const CustomListTypeDownload(
                                                  type: "360P",
                                                  typesize: "Mp4",
                                                  size: "50Mb"),
                                              const CustomListTypeDownload(
                                                  type: "260P",
                                                  typesize: "Mp4",
                                                  size: "30Mb"),
                                              const CustomListTypeDownload(
                                                  type: "144P",
                                                  typesize: "Mp4",
                                                  size: "10Mb"),
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
                                    );
                                  },
                                );
                              },
                               );
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
                    );
                  },
                ),
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
                          if (controller.value.isPlaying) {
                            setState(() {
                              controller.pause();
                            });
                          } else {
                            setState(() {
                              controller.play();
                            });
                          }
                        },
                        child:
                            Text(controller.value.isPlaying ? "Play" : "Pause"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
