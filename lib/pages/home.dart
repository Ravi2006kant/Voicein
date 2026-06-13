import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final SpeechToText speechToText = SpeechToText();

  String spokenText = "Tap To Speak";

  @override
  void initState() {Future<void> initSpeech() async {
  bool available = await speechToText.initialize(
    onStatus: (status) {
      debugPrint("STATUS: $status");
    },
    onError: (error) {
      debugPrint("ERROR: $error");
    },
  );

  debugPrint("AVAILABLE: $available");
}
    initSpeech();
  }

Future<void> initSpeech() async {
  bool available = await speechToText.initialize(
    onStatus: (status) {
      debugPrint("STATUS: $status");
    },
    onError: (error) {
      debugPrint("ERROR: $error");
    },
  );

  debugPrint("AVAILABLE: $available");
}

  void startListening() async {
    if (!speechToText.isListening) {
      await speechToText.listen(
        onResult: (result) {
          setState(() {
            spokenText = result.recognizedWords;
          });
        },
      );
    } else {
      await speechToText.stop();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          "Voice Assistant",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      print("BUTTON WORKING");

                      setState(() {
                        spokenText = "Button Clicked";
                      });
                    },
                    icon: const Icon(Icons.mic, size: 40),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Tap To Speak",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                spokenText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
