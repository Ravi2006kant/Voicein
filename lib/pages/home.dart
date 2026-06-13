import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SpeechToText speechToText = SpeechToText();
  bool isListen = false;
  String spokenText = "tap to speak";

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  Future<void> initSpeech() async {
    await speechToText.initialize();
  }

  void startListening() async {
    await speechToText.listen(
      onResult: (result) {
        setState(() {
          spokenText = result.recognizedWords;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        title: Text(
          "Voice Assistant",
          style: TextStyle(
            fontWeight: .bold,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    IconButton(
                      onPressed: startListening,
                      icon: Icon(Icons.mic, size: 40),
                      color: Colors.white,
                    ),
                    SizedBox(height: 5),
                    Text('tap to speak', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
          Text(spokenText, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
