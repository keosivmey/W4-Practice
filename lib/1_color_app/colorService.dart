import 'package:flutter/material.dart';
import 'color_app.dart';

class ColorService extends ChangeNotifier {
  int _redTapCount = 0;
  int _blueTapCount = 0;

  int get redTapCount => _redTapCount;
  int get blueTapCount => _blueTapCount;

  void incrementTap(CardType type) {
    if (type == CardType.red) {
      _redTapCount++;
    } else {
      _blueTapCount++;
    }

    notifyListeners(); 
  }
}
