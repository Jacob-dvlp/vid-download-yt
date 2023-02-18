import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoYouTubePage extends StatefulWidget {
  final String? id;
  final String? descption;
  final String? channelName;
  const VideoYouTubePage(
      {super.key, this.id, this.descption, this.channelName});

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(height: 400, child: player),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 300,
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
              )
            ],
          ),
        );
      });
}
