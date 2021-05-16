import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 69, 151, 1),

      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 5,
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            // HOME PAGE ICON
            SizedBox(height: 40.0),
            Icon(
              Icons.home,
              color: Colors.white,
              size: 80,
            ),
            SizedBox(height: 15.0),
            Text(
              'Home Page',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),

            // PLAY VIDEO BUTTON
            SizedBox(height: 90.0),
            TextButton.icon(
              onPressed: () {Navigator.pushNamed(context, '/play');},
              icon: Icon(
                Icons.play_circle_fill,
                color: Colors.white70,
                size: 50,
              ),
              label: Text(
                'Play a Video',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
            ),

            // TAKE POLL BUTTON
            SizedBox(height: 20.0),
            TextButton.icon(
              onPressed: () {Navigator.pushNamed(context, '/poll');},
              icon: Icon(
                Icons.poll,
                color: Colors.white70,
                size: 50,
              ),
              label: Text(
                'Take a Poll',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
            ),

            // RECORD VOICE BUTTON
            SizedBox(height: 20.0),
            TextButton.icon(
              onPressed: () {Navigator.pushNamed(context, '/record');},
              icon: Icon(
                Icons.record_voice_over,
                color: Colors.white70,
                size: 50,
              ),
              label: Text(
                'Record Your Voice',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}