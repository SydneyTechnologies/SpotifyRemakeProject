import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class CurrentTrack extends ChangeNotifier {
  Song? currentTrack;

  getCurrentTrack() {
    return currentTrack;
  }

  void changeSong(var track) {
    currentTrack = track;
    notifyListeners();
  }
}
