import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:kina/home.dart';
import 'package:audioplayers/audioplayers.dart';
import 'halaman4.dart';
import 'halaman6.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(Halaman5());
}

class Halaman5 extends StatelessWidget {
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
    await audioPlayer.play(AssetSource('audio/hal 5.mp3'));
  }

  void _stopAudio() {
    audioPlayer.pause(); // Pause the audio
    audioPlayer.seek(Duration.zero); // Rewind the audio to the beginning
  }

  @override
  void dispose() {
    audioPlayer.dispose(); // Dispose the audio player when the widget is disposed
    super.dispose();
  }

  void _navigateToNextPage() {
    _stopAudio(); // Stop the audio before navigating to the next page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Halaman6()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bghal5.jpg'),
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
            top: 0,
            left: MediaQuery.of(context).size.width * 0.86,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              alignment: Alignment.topCenter,
              child: GestureDetector(
                child: Image.asset(
                  'images/buttonsound.jpg', 
                  height: MediaQuery.of(context).size.width * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.42,
            left: MediaQuery.of(context).size.width * 0.75,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.045),
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => Halaman6(),
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
                  width: MediaQuery.of(context).size.width * 0.09,
                  height: MediaQuery.of(context).size.width * 0.09,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.43,
            left: 0,
            right: MediaQuery.of(context).size.width * 0.75,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.045),
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => Halaman4(),
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
                  width: MediaQuery.of(context).size.width * 0.09,
                  height: MediaQuery.of(context).size.width * 0.09,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.68,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.29,
              decoration: BoxDecoration(
                color: Colors.brown.withOpacity(0.8),
                borderRadius: BorderRadius.circular(30),
              ),
             child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Di dalam syurga yang indah, Nabi Adam a.s. telah diberi kehormatan oleh Allah s.w.t. dengan ditempatkan di syurga. Namun, beliau diberi satu arahan: jangan mendekati satu pohon tertentu',
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.015,
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
