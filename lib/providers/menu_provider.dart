import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {
  List<dynamic> _menus = [];

  List<dynamic> get menus => _menus;

  void setMenus(List<dynamic> menus) {
    _menus = menus;
    notifyListeners();
  }
}
