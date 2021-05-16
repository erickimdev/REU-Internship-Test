import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

const String API_KEY = 'AIzaSyAXuF_hYzctKZJOuHQ5g6TclQZK7GHsR0g';

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  YoutubePlayerController _player = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=XZNjGVXRkEA&t=31s&ab_channel=WenyaoXu"),
      flags: YoutubePlayerFlags(
        autoPlay: false,
      )
    );

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _player,
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(34, 69, 151, 1),

          appBar: AppBar(
            title: Text('Play a Video'),
            centerTitle: true,
            backgroundColor: Colors.black,
            elevation: 5,
          ),

          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                player,
              ],
            ),
          ),
        );
      },
    );
  }
}