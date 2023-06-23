// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:jp_city_pop/src/controllers/audio_player_controler.dart';

import '../models/music_model.dart';

class MusicWidget extends StatefulWidget {
  final Music musicObject;
  final AudioPlayerController player_controller;
  final selectMusic;
  final int index;
  final dynamic upp;

  const MusicWidget({
    Key? key,
    required this.musicObject,
    required this.player_controller,
    required this.index,
    required this.upp,
    this.selectMusic,
  }) : super(key: key);

  @override
  State<MusicWidget> createState() => _MusicWidgetState();
}

class _MusicWidgetState extends State<MusicWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.player_controller.playMusic(widget.musicObject.musicLink);
        widget.upp();
      },
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(widget.musicObject.thumb),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.musicObject.name,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.musicObject.artist} - ${widget.musicObject.year}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
