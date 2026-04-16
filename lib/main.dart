import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(xylophone());
}

class xylophone extends StatelessWidget {
  const xylophone({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(style: TextStyle(color: Colors.white), "AudioPlayer"),
        ),
        backgroundColor: Colors.teal[700],
        body: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                playSound(1, "سبحان الله", Colors.white),
                playSound(2, "والحمد لله", Colors.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded playSound(int soundNumber, String text, Color colorName) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playAudio(soundNumber);
        },
        style: TextButton.styleFrom(
          backgroundColor: colorName,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Text(style: TextStyle(fontSize: 25), text),
      ),
    );
  }

  void playAudio(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource("sound$soundNumber.mp3"));
  }
}
