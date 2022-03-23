import 'package:just_audio/just_audio.dart';

class Accelo {
  Future<void> validateUserAccelo(double z) async {
    final player = AudioPlayer();

    if (z == 9.5 || z <= 9.5) {
      await player.setAsset('assets/audio/push.mp3');
      player.play();
    } else {
      //TODO: Implementation for Counting how many cpr per second performed;
    }
  }
}