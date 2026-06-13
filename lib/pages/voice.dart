import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';

class Voice extends StatefulWidget {
  const Voice({super.key});

  @override
  State<Voice> createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voice Assistant"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              InstalledApps.startApp('com.whatsapp');
            },
            child: CircleAvatar(
              backgroundColor: Colors.pink,
              child: Icon(Icons.mail_rounded, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
