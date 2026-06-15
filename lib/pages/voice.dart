import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'package:voicein/services/command.dart';

class Voice extends StatefulWidget {
  const Voice({super.key});

  @override
  State<Voice> createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  final SpeechToText stx = SpeechToText();

  String inputedText = "Tap To Speak";
  String command = "";
  @override
  void initState() {
    super.initState();
    speechinit();
  }

  Future<void> speechinit() async {
    await stx.initialize();
  }

  Future<void> speechlisten() async {
    await stx.listen(
      onResult: (result) {
        setState(() {
          inputedText = result.recognizedWords;
        });

        Command.process(command);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voice Assistant", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (stx.isListening) {
                  stx.stop();
                } else {
                  speechlisten();
                }
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.mic, color: Colors.white, size: 60),
              ),
            ),

            SizedBox(height: 30),

            Text(
              "Tap To Speak",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                inputedText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
