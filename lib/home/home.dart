import 'package:flutter/material.dart';
import 'package:video_demo/ui_testing.dart';
import 'package:video_demo/views/youtube_video_player.dart';

import '../views/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    /*  return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return const Center(
            child: Text("I am LandScape "),
          );
        } else if (orientation == Orientation.portrait) {
          return const Center(
            child: Text("I am Portrate "),
          );
        }
       
        else {
          return Center(
            child: Text("${Orientation.values}}"),
          );
        }
      },
    ); */

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Flutter UI"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen())),
                    child: const Text(
                      "API VIDEO",
                      style: TextStyle(fontSize: 16, decoration: TextDecoration.underline, decorationThickness: 2, decorationColor: Colors.red),
                    )),
                TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => YoutubeVideoPlayerScreen())),
                    child: const Text(
                      "YOUTUBE VIDEO",
                      style: TextStyle(fontSize: 16, decoration: TextDecoration.underline, decorationThickness: 2, decorationColor: Colors.red),
                    )),
              ],
            ),
            TextButton(
              child: Text("Testing Ui"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UiTestingScreen())),
            )
          ],
        ),
      ),
    );
  }
}
