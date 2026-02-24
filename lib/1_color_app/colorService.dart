import 'package:flutter/material.dart';
import 'color_app.dart';

class ColorService extends ChangeNotifier {
  final Map<CardType, int> _tapCounts = {};

  ColorService() {
    for (var type in CardType.values) {
      _tapCounts[type] = 0;
    }
  }

  Map<CardType, int> get tapCounts => _tapCounts;

  void incrementTap(CardType cardType) {
    _tapCounts[cardType] = _tapCounts[cardType]! + 1;
    notifyListeners();
  }
}
