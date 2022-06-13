import 'package:flutter/material.dart';

import '../data/data.dart';

class CurrentSongModel extends ChangeNotifier {
  Song? selected;

  void selectSong(Song song) {
    selected = song;
    notifyListeners();
  }
}
