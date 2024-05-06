import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController controller;

  String videoUrl = "https://www.shutterstock.com/shutterstock/videos/1023770083/preview/stock-footage-circa-s-american-industrial-might-in-includes-giant-textile-factories.webm";

  bool _isPlayBtnClick = true;
  double _currentSliderSecondaryValue = 0.0;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    _currentSliderSecondaryValue = controller.value.position.inMilliseconds.toDouble();
    controller.addListener(() {
      setState(() {});
    });
    controller.setLooping(true);
    controller.initialize().then((_) => setState(() {}));
    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("API Video Player"),
      ),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                if (controller.value.isPlaying) {
                  controller.pause();
                } else {
                  controller.play();
                }
              },
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(formatDuration(controller.value.position)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SliderTheme(
                      data: SliderThemeData(activeTrackColor: Colors.blue, inactiveTrackColor: Colors.black, trackHeight: 3, overlayShape: SliderComponentShape.noThumb),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: Slider(
                              min: 0.0,
                              max: controller.value.duration.inMilliseconds.toDouble(),
                              value: controller.value.position.inMilliseconds.toDouble(),
                              onChanged: (value) {
                                setState(() {
                                  controller.seekTo(Duration(milliseconds: value.toInt()));
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(formatDuration(controller.value.duration - controller.value.position)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      print("You clicked Previous Button");
                    },
                    icon: const Icon(Icons.skip_previous)),
                IconButton(
                    onPressed: () {
                      if (_isPlayBtnClick == true) {
                        setState(() {
                          _isPlayBtnClick = false;
                          controller.pause();
                        });
                      } else {
                        setState(() {
                          _isPlayBtnClick = true;
                          controller.play();
                        });
                      }
                    },
                    icon: _isPlayBtnClick ? const Icon(Icons.play_arrow) : const Icon(Icons.pause)),
                IconButton(
                    onPressed: () {
                      print("You clicked Next Button");
                    },
                    icon: const Icon(Icons.skip_next)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
