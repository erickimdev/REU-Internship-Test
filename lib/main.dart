import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'home.dart';
import 'play.dart';
import 'poll.dart';
import 'record.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: _MainPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => _MainPage(),
        '/home': (context) => HomePage(),
        '/play': (context) => PlayPage(),
        '/poll': (context) => PollPage(),
        '/record': (context) => RecordPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

class _MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    HomePage(),
    PlayPage(),
    PollPage(),
    RecordPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(34, 69, 151, 1),

        body: _tabs[_currentIndex],

        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.grey[900],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill),
            label: "Video",
            backgroundColor: Colors.grey[900],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll),
            label: "Poll",
            backgroundColor: Colors.grey[900],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.record_voice_over),
            label: "Record",
            backgroundColor: Colors.grey[900],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
            backgroundColor: Colors.grey[900],
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}