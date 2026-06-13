import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voicein/services/appLauncher_service.dart';

class Voice extends StatefulWidget {
  const Voice({super.key});

  @override
  State<Voice> createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  final SpeechToText stx = SpeechToText();
  String inputedText = "input text here show";
  //start the system speech engine
  @override
  void initState() {
    super.initState();
    speechinit();
  }

  //check for microphone and speech text engine
  Future<void> speechinit() async {
    await stx.initialize();
  }

  Future<void> speechlisten() async {
    await stx.listen(
      onResult: (result) {
        stx.listen(
          onResult: (result) {
            setState(() {
              inputedText = result.recognizedWords;
              //this will open the gmail
              String command = result.recognizedWords.toLowerCase();
              if (command.contains("gmail")) {
                ApplauncherService.openGmail();
              } else if (command.contains("whatsapp")) {
                ApplauncherService.openWhatsapp();
              } else {
                inputedText = "no input";
              }
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Voice Assistant",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //for tapping the container
            GestureDetector(
              onTap: () {
                speechlisten();
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.mic, color: Colors.white, size: 60),
              ),
            ),

            SizedBox(height: 30),
            //hint text for the user
            Text(
              "Tap To Speak",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),
            // show the user input text
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
