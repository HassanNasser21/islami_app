import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RadioProvider extends ChangeNotifier {
  AudioPlayer player = AudioPlayer();
  String? currentPlayingUrl;
  bool isPlaying = false;
  double currentVolume = 2;

  Future<void> play(String url) async {
    if (currentPlayingUrl == url) {
      isPlaying ? await player.pause() : player.resume();
      isPlaying = !isPlaying;
    } else {
      await player.stop();
      currentPlayingUrl = url;
      await player.play(UrlSource(url), volume: currentVolume);
      isPlaying = true;
    }
    notifyListeners();
  }

  Future<void> stop() async {
    await player.stop();
    currentPlayingUrl = null;
    isPlaying = false;
    notifyListeners();
  }

  setVolume(double volume) async {
    currentVolume = volume;
    await player.setVolume(currentVolume);
    notifyListeners();
  }
}
