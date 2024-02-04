import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

/// Stateful widget to fetch and then display video content.
class SoundApp extends StatefulWidget {
  const SoundApp({super.key});

  @override
  _SoundAppState createState() => _SoundAppState();
}

class _SoundAppState extends State<SoundApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
            children: [
            ItemAudio(url: 'https://server6.mp3quran.net/thubti/001.mp3', name: 'سورة الفاتحة',),
            ItemAudio(url: 'https://server6.mp3quran.net/thubti/002.mp3', name: 'سورة البقرة',),
            ItemAudio(url: 'https://server6.mp3quran.net/thubti/003.mp3', name: 'سورة آل عمران',),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ItemAudio extends StatefulWidget {
  final String url,name;
  const ItemAudio({super.key, required this.url, required this.name});

  @override
  State<ItemAudio> createState() => _ItemAudioState();
}

class _ItemAudioState extends State<ItemAudio> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(widget.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),),
          FloatingActionButton(
            onPressed: () {
              if (audioPlayer.state == PlayerState.playing) {
                audioPlayer.pause();
              } else {
                audioPlayer.play(
                  UrlSource(
                    widget.url,
                  ),
                );
              }
              setState(() {});
            },
            child:
                Text(audioPlayer.state == PlayerState.playing ? "Pause" : "Play"),
          ),
        ],
      ),
    );
  }
}
