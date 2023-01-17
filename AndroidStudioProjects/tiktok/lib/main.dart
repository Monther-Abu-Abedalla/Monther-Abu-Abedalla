import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Shorts Previewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'YouTube Shorts Previewer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Declare a list of YouTube shorts video URLs
  List<String> shortVideos = [
    'https://www.youtube.com/watch?v=abc123',
    'https://www.youtube.com/watch?v=def456',
    'https://www.youtube.com/watch?v=ghi789',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ""),
      ),
      body: ListView.builder(
        itemCount: shortVideos.length,
        itemBuilder: (context, index) {
          // Use the `video_player` widget to display the video
          return VideoPlayer(VideoPlayerController.network(
            shortVideos[index],
          )
              // dataSource: DefaultCacheManager().getFileStream(shortVideos[index]),
              // aspectRatio: 16 / 9,
              // autoInitialize: true,
              // looping: true,
              );
        },
      ),
    );
  }
}
