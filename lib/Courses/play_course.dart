import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      children: [
                        VideoPlayer(_controller),
                        Center(
                          child: IconButton(
                            iconSize: 64,
                            color: Colors.black,
                            icon: _isPlaying
                                ? Icon(
                                    Icons.pause_circle_filled,
                                    color: Colors.black,
                                  )
                                : Icon(
                                    Icons.play_circle_filled,
                                    color: Colors.black,
                                  ),
                            onPressed: () {
                              setState(() {
                                _isPlaying = !_isPlaying;
                                if (_isPlaying) {
                                  _controller.play();
                                } else {
                                  _controller.pause();
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Text("Loading"),
                  ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.thumb_up),
                label: Text('Like'),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.share),
                label: Text('Share'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Video Title',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 8.0),
                Text(
                  'Video Description',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
