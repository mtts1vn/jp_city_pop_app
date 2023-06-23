// ignore_for_file: public_member_api_docs, sort_constructors_first
class Music {
  //music infos
  String name;
  String artist;
  String thumb;
  int year;

  //external infos
  String musicLink;

  //constructor
  Music({
    required this.name,
    required this.artist,
    required this.thumb,
    required this.year,
    required this.musicLink,
  });
}
