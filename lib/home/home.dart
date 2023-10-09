import 'package:flutter/material.dart';
import 'package:video_demo/views/video_player.dart';
import 'package:video_demo/views/youtube_video_player.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Flutter UI"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(

                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideoPlayerScreen())),
                child: const Text(
                  "API VIDEO",
                  style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: Colors.red),
                )),
            TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YoutubeVideoPlayerScreen())),
                child: const Text("YOUTUBE VIDEO",
                style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                    decorationColor: Colors.red
                ),)),
          ],
        ),
      ),
    );
  }
}
