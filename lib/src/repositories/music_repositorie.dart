// ignore_for_file: prefer_final_fields

import 'package:jp_city_pop/src/models/music_model.dart';

class MusicRepositorie {
  List<Music> _songs = [
    Music(
      name: 'Stay With Me',
      artist: 'Miki Matsubara',
      thumb: 'assets/images/thumbs/staywithme.jpg',
      year: 1980,
      musicLink:
          'https://dl.sndup.net/b972/SnapInstaio%20-%20Miki%20Matsubara.mp3',
    ),
    Music(
      name: 'Flyday Chinatown',
      artist: 'Yasuha',
      thumb: 'assets/images/thumbs/flydaychinatown.jpg',
      year: 1981,
      musicLink:
          'https://dl.sndup.net/scxy/SnapInstaio%20-%20Yasuha%20-%20Flyday%20Chinatown%20(128%20kbps).mp3',
    ),
    Music(
      name: '4:00A.M.',
      artist: 'Taeko Ohnuki',
      thumb: 'assets/images/thumbs/4am.jpg',
      year: 1978,
      musicLink: 'https://dl.sndup.net/y9x7/400am.mp3',
    ),
    Music(
      name: 'WINDY SUMMER',
      artist: 'Anri',
      thumb: 'assets/images/thumbs/windysummer.jpg',
      year: 1983,
      musicLink:
          'https://dl.sndup.net/hgmh/SnapInstaio%20-%20Anri%20-%20Windy%20Summer%20(128%20kbps).mp3',
    ),
    Music(
      name: 'Sunset Road',
      artist: 'Takahashi Reiko',
      thumb: 'assets/images/thumbs/sunsetroad.jpg',
      year: 1987,
      musicLink: 'https://dl.sndup.net/nnjq/Sunset%20Road.mp3',
    ),
  ];

  get getSongs => _songs;
  get getSongsLenght => _songs.length;
}
