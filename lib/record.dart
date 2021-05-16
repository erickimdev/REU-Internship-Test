import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class RecordPage extends StatefulWidget {
  @override
  _RecordPageState createState() => _RecordPageState();
}

enum RecordingState {
  recording,
  stopped,
}

class _RecordPageState extends State<RecordPage> {
  IconData _recordIcon = Icons.mic_none;
  RecordingState _recordingState = RecordingState.stopped;
  FlutterAudioRecorder recorder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(34, 69, 151, 1),

      appBar: AppBar(
        title: Text('Record Your Voice'),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 5,
      ),

      body: Center(
        child: Column(
          children: <Widget>[
            // RECORD ICON
            SizedBox(height: 40.0),
            Icon(
              Icons.record_voice_over,
              color: Colors.white,
              size: 80,
            ),
            SizedBox(height: 40.0),
            Text(
              'Hold the button and say\n\"Glad to meet you\"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
            ),

            // RECORD BUTTON
            SizedBox(height: 130.0),
            TextButton.icon(
              onPressed: () async {
                await _buttonPressed();
                setState(() {});
              },
              icon: Icon(
                _recordIcon,
                color: Colors.white70,
                size: 40,
              ),
              label: Text(
                "Record",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 25,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  ///////////////////// HELPER FUNCTIONS /////////////////////
  popupConfirm(BuildContext context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Recording Successful"),
        actions: [
          TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: Colors.black,
                size: 17,
              ),
              label: Text(
                "Close",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              )
          ),
        ],
      );
    });
  }

  _startRecording() async => await recorder.start();
  _stopRecording() async {
    popupConfirm(context);
    await recorder.stop();
  }

  Future<void> _buttonPressed() async {
    switch (_recordingState) {
      case RecordingState.recording:
        await _stopRecording();
        _recordingState = RecordingState.stopped;
        _recordIcon = Icons.mic;
        break;

      case RecordingState.stopped:
        await _recordVoice();
        break;
    }
  }

  _initRecorder() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String filePath = appDirectory.path + '/' +
        DateTime.now().millisecondsSinceEpoch.toString() + '.aac';
    print("video saved to " + filePath.toString());

    recorder = FlutterAudioRecorder(filePath, audioFormat: AudioFormat.AAC);
    await recorder.initialized;
  }

  Future<void> _recordVoice() async {
    if (await FlutterAudioRecorder.hasPermissions) {
      await _initRecorder();

      await _startRecording();
      _recordingState = RecordingState.recording;
      _recordIcon = Icons.stop;
    }
  }
}