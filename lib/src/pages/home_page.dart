// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:jp_city_pop/src/controllers/audio_player_controler.dart';
import 'package:jp_city_pop/src/models/music_model.dart';
import 'package:jp_city_pop/src/repositories/music_repositorie.dart';
import 'package:jp_city_pop/src/widgets/music_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MusicRepositorie _repositorie = MusicRepositorie();
  AudioPlayerController _controller = AudioPlayerController();
  late final List<Music> _musics;

  bool _isPaused = false;
  late Music _selectedMusic;
  int _currentMusicIndex = 0;
  @override
  void initState() {
    super.initState();
    _musics = _repositorie.getSongs;
    _selectedMusic = _musics[_currentMusicIndex];
    _controller.playMusic(_musics[_currentMusicIndex].musicLink);
    _controller.pauseMusic();
  }

  @override
  Widget build(BuildContext context) {
    var sz = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: sz.width,
        height: sz.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            opacity: 0.3,
            image: AssetImage('assets/images/backgrounds/homebackground1.jpg'),
          ),
        ),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: sz.width * 0.8,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: sz.width * 0.4,
                                        child:
                                            Image.asset(_selectedMusic.thumb),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    _selectedMusic.name,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 20.0, top: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: IconButton(
                                        iconSize: 50,
                                        onPressed: () {
                                          _controller.changeMusic(-1, _musics);
                                          setState(() {
                                            _currentMusicIndex != 0
                                                ? _currentMusicIndex--
                                                : _currentMusicIndex;
                                            _selectedMusic =
                                                _musics[_currentMusicIndex];
                                          });
                                        },
                                        splashColor: Colors.transparent,
                                        icon: Icon(
                                          Icons
                                              .keyboard_double_arrow_left_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8.0, left: 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: IconButton(
                                          iconSize: 50,
                                          onPressed: () {
                                            _isPaused
                                                ? _controller.despauseMusic()
                                                : _controller.pauseMusic();
                                            setState(() {
                                              _isPaused = !_isPaused;
                                            });
                                          },
                                          splashColor: Colors.transparent,
                                          icon: Icon(
                                            !_isPaused
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: IconButton(
                                        iconSize: 50,
                                        onPressed: () {
                                          _controller.changeMusic(1, _musics);
                                          setState(() {
                                            _currentMusicIndex + 1 !=
                                                    _musics.length
                                                ? _currentMusicIndex++
                                                : _currentMusicIndex;
                                            _selectedMusic =
                                                _musics[_currentMusicIndex];
                                          });
                                        },
                                        splashColor: Colors.transparent,
                                        icon: Icon(
                                          Icons
                                              .keyboard_double_arrow_right_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: _repositorie.getSongsLenght,
                itemBuilder: (context, index) {
                  Music _music = _musics[index];

                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 5, right: 5),
                    child: MusicWidget(
                      musicObject: _music,
                      player_controller: _controller,
                      index: index,
                      upp: () {
                        if (_musics[_currentMusicIndex] != _music) {
                          setState(() {
                            _currentMusicIndex = index;
                            _selectedMusic = _musics[_currentMusicIndex];
                          });
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
