import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      home: FirstActivity(),
    ));

class FirstActivity extends StatelessWidget {
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: new XylophoneApp(),
      backgroundColor: Colors.black,
      title: new Text(
        'Xylophone',
        style: new TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.red,
            fontFamily: 'Lobster'),
      ),
      image: Image.asset('images/ic_launcher-web.png'),
      photoSize: 120.0,
      loaderColor: Colors.red,
    );
  }
}

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({Color color, int soundNumber}) {
    return Expanded(
      child: Card(
        child: FlatButton(
          color: color,
          onPressed: () {
            playSound(soundNumber);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red, soundNumber: 1),
              buildKey(color: Colors.orange, soundNumber: 2),
              buildKey(color: Colors.yellow, soundNumber: 3),
              buildKey(color: Colors.green, soundNumber: 4),
              buildKey(color: Colors.teal, soundNumber: 5),
              buildKey(color: Colors.blue, soundNumber: 6),
              buildKey(color: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
