import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:kina/halaman1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(Mulai());
}

class Mulai extends StatelessWidget {
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
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playAudio();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio() async {
    // Ganti URL dengan path atau URL file audio yang ingin Anda putar
    await _audioPlayer.play(AssetSource('audio/homepages.mp3'));
  }

  void _navigateToPage(Widget page) {
    _audioPlayer.stop(); // Stop audio sebelum navigasi
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: 1.0, // Mengisi lebar layar
            heightFactor: 1.0, // Mengisi tinggi layar
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bghome.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.all(32),
              child: GestureDetector(
                onTap: () {
                  _navigateToPage(Halaman1()); // Gunakan metode navigasi
                },
                child: AnimatedTextKina(),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.6,
            left: MediaQuery.of(context).size.width * 0.25,
            right: MediaQuery.of(context).size.width * 0.25,
            child: Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.topCenter,
              child: AnimatedPlayButton(onTap: () {
                _navigateToPage(Halaman1()); // Gunakan metode navigasi
              }),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.0,
            right: MediaQuery.of(context).size.width * 0.85,
            child: Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AboutPageDialog(),
                  );
                },
                child: Image.asset(
                  'images/buttonabout.jpg',
                  width: MediaQuery.of(context).size.width * 0.09,
                  height: MediaQuery.of(context).size.width * 0.09,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedTextKina extends StatefulWidget {
  @override
  _AnimatedTextKinaState createState() => _AnimatedTextKinaState();
}

class _AnimatedTextKinaState extends State<AnimatedTextKina>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -20.0, end: -15.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutSine,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, _animation.value),
          child: child,
        );
      },
      child: Image.asset(
        'images/tekskina.jpg',
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.width * 0.6,
      ),
    );
  }
}

class AnimatedPlayButton extends StatefulWidget {
  final VoidCallback onTap;

  AnimatedPlayButton({required this.onTap});

  @override
  _AnimatedPlayButtonState createState() => _AnimatedPlayButtonState();
}

class _AnimatedPlayButtonState extends State<AnimatedPlayButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 0.3,
            child: child,
          );
        },
        child: Image.asset(
          'images/buttonplay.jpg',
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.width * 0.15,
        ),
      ),
    );
  }
}

class AboutPageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Image
          Image.asset(
            'images/about.jpg',
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.75,
            fit: BoxFit.cover,
          ),
          // Overlay Container dengan Teks
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2, // Atur posisi top di sini
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              width: MediaQuery.of(context).size.width * 0.45, // Lebar container
              height: MediaQuery.of(context).size.height * 0.5, // Tinggi container
              alignment: Alignment.centerLeft, // Posisi teks rata kiri
              color: Colors.black.withOpacity(0.0), // Membuat warna hitam menjadi tidak terlihat
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Selamat Datang di Kina!\n\nHai teman-teman! Mari kita jelajahi kisah seru Nabi Adam, dari saat beliau diciptakan di surga yang indah, sampai perjalanan hidupnya di dunia. Kita akan mendengar banyak cerita menarik dan pelajaran berharga bersama Nabi Adam.\nDi Kina, kamu bisa mendengarkan cerita dengan suara yang asyik dan musik yang keren di latar belakang. Kamu akan merasa seperti sedang berada di dalam cerita itu loh!\n\nSiapa sih yang membuat Kina?\nAninndyo Ayom Prakoso adalah developer super yang membuat Kina bisa kamu buka di ponsel atau tablet.\nRahma Tania Putri Lukita adalah designer hebat yang membuat gambar-gambar di Kina jadi cantik dan keren.\nYuk, buka Kina dan mulai petualanganmu dengan Nabi Adam!',
                        textAlign: TextAlign.left, // Teks menjadi rata kiri
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.015,
                          fontFamily: "Bryndan_Write",
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
