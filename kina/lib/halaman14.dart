import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kina/home.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'halaman15.dart';
import 'halaman13.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(Halaman14());
}

class Halaman14 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandscapePage(),
    );
  }
}

class LandscapePage extends StatefulWidget {
  @override
  _LandscapePageState createState() => _LandscapePageState();
}

class _LandscapePageState extends State<LandscapePage> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _playVoiceOver();
  }

  Future<void> _playVoiceOver() async {
    await audioPlayer.play(AssetSource('audio/halaman14.mp3'));
  }

  @override
  void dispose() {
    audioPlayer.dispose(); // Dispose the audio player when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Start playing audio when the page is built
    _playVoiceOver();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/14.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: MediaQuery.of(context).size.width * 0.86,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Mulai()));
                },
                child: Image.asset(
                  'images/buttongohome.jpg',
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.47, // Adjusted top position
            left: width * 0.75, // Adjusted left position
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => Halaman15(),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Image.asset(
                  'images/buttongo.jpg',
                  width: width * 0.09, // Adjusted width
                  height: width * 0.09, // Adjusted height
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.47, // Adjusted top position
            left: 0,
            right: width * 0.75, // Adjusted right position
            child: Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => Halaman13(),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Image.asset(
                  'images/buttonback.jpg',
                  width: width * 0.09, // Adjusted width
                  height: width * 0.09, // Adjusted height
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: MediaQuery.of(context).size.width * 0.86,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              alignment: Alignment.topCenter,
              child: GestureDetector(
                child: Image.asset(
                  'images/buttonsound.jpg',
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.7, // Adjusted top position
            left: width * 0.1, // Adjusted left position
            right: width * 0.1, // Adjusted right position
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              height: height * 0.26, // Adjusted height
              decoration: BoxDecoration(
                color: Colors.brown.withOpacity(0.8),
                borderRadius: BorderRadius.circular(30),
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Mereka menjadi pasangan suami-istri pertama di dunia. Bersama-sama, mereka diberkahi dengan anak-anak yang penuh kebahagiaan. Setiap kelahiran selalu disertai dengan keajaiban, karena selalu lahir kembar, laki-laki dan perempuan',
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontSize: width * 0.015,
                      fontFamily: "Bryndan_Write",
                      color: Colors.white,
                    ),
                    speed: Duration(milliseconds: 50),//kecepatan muncul tulisan
                  ),
                ],
                totalRepeatCount: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
