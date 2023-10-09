import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class YoutubeVideoPlayerScreen extends StatefulWidget {
  const YoutubeVideoPlayerScreen({super.key});

  @override
  State<YoutubeVideoPlayerScreen> createState() => _YoutubeVideoPlayerScreenState();
}

class _YoutubeVideoPlayerScreenState extends State<YoutubeVideoPlayerScreen> {
 late YoutubePlayerController _controller;
 //String youTubelVideoUrl ='https://youtu.be/3JbyTOTIQa8?si=Ciyz13QofqiSWwdv';

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '4IenX7OHumk',
      flags:const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Youtube Video"),),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors:const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
          onReady: () {
            _controller.addListener(() {});
          },
        ),
        builder: (context, player) => player,
      ),
    );
  }
}
