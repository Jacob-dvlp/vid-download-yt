import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
          floatingActionButton: CircleAvatar(
            backgroundColor: Colors.red,
            child: IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.red,
            title: Text(widget.channelName!),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Descrição: ${widget.descption!}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
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
                    child: Text(controller.value.isPlaying ? "Play" : "Pause"),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: 200,
                  child: GetBuilder<SheachedVideoController>(
                    init: SheachedVideoController(Get.find(), Get.find()),
                    builder: (controller) {
                      return controller.isDownload
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red, elevation: 20),
                              onPressed: () {
                                controller
                                    .downloadVideo(widget.id!)
                                    .whenComplete(() {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        height: 2000,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                widget.channelName!,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width: Get.width,
                                                height: 250,
                                                child: CachedNetworkImage(
                                                  imageUrl: widget.thumbnails!,
                                                  fit: BoxFit.contain,
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                    backgroundColor: Colors.red,
                                                    color: Colors.white,
                                                  )),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 40, left: 8),
                                                    child: Icon(
                                                      Icons.error,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.download),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Baixar")
                                ],
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.red,
                                color: Colors.white,
                              ),
                            );
                    },
                  ))
            ],
          ),
        );
      });
}
