import 'package:flutter/material.dart';

class Darkmode extends ChangeNotifier {
  Brightness Bmode = Brightness.light;

  brightnessmode() {
    if (Bmode == Brightness.light) {
      Bmode = Brightness.dark;
    } else if (Bmode == Brightness.dark) {
      Bmode = Brightness.light;
    }
    notifyListeners();
  }

  brightnessicon() {
    if (Bmode == Brightness.dark) {
      const Icon(
        Icons.dark_mode_outlined,
        
      );
    } else if (Bmode == Brightness.light) {
      Icon(
        Icons.wb_sunny_rounded,
       
      );
    }
    notifyListeners();
  }
}
