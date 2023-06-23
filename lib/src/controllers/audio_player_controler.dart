import 'package:audioplayers/audioplayers.dart';
import 'package:jp_city_pop/src/models/music_model.dart';

class AudioPlayerController {
  AudioPlayer audioPlayer = AudioPlayer();

  void playMusic(String url) {
    audioPlayer.play(UrlSource(url));
  }

  void pauseMusic() => audioPlayer.pause();
  void despauseMusic() => audioPlayer.resume();

  int currentIndexMusic = 0;

  void changeMusic(int mudar, List<Music> musics) {
    mudarMusic() {
      currentIndexMusic += mudar;
      playMusic(musics[currentIndexMusic].musicLink);
    }

    switch (mudar) {
      case -1:
        if (currentIndexMusic != 0) {
          mudarMusic();
        }
        break;
      case 1:
        if (currentIndexMusic + 1 != musics.length) {
          mudarMusic();
        }
        break;
    }
  }
}
