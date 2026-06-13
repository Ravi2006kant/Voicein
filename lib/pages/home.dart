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
  void initState() {
    super.initState();
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

  Future<void> startListening() async {
    debugPrint("START LISTENING");

    await speechToText.listen(
      onResult: (result) {
        debugPrint("WORDS: ${result.recognizedWords}");

        setState(() {
          spokenText = result.recognizedWords;
        });
      },
    );

    debugPrint("LISTEN CALLED");
  }

  Future<void> stopListening() async {
    await speechToText.stop();

    debugPrint("STOPPED");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voice Assistant"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (!speechToText.isListening) {
                  startListening();
                } else {
                  stopListening();
                }
              },
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: speechToText.isListening
                      ? Colors.green
                      : Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  speechToText.isListening
                      ? Icons.mic
                      : Icons.mic_none,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              speechToText.isListening
                  ? "Listening..."
                  : "Tap To Speak",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                spokenText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}