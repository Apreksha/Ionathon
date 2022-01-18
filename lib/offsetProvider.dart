import 'package:flutter/cupertino.dart';

class offsetProvider with ChangeNotifier{
  double _xoffSetSecond = 0;
  double get xoffsetSecond => _xoffSetSecond;
  double _yoffSetSecond = 0;
  double get yoffSetSecond => _yoffSetSecond;
  double _angleSecond = 0;
  double get angleSecond => _angleSecond;
  bool _isOpen = false;
  bool get isOpen => _isOpen;
  double _xoffSetHome = 0;
  double get xoffsetHome => _xoffSetHome;
  double _yoffSetHome = 0;
  double get yoffSetHome => _yoffSetHome;
  double _angleHome = 0;
  double get angleHome => _angleHome;
  void closedDrawer(){
    _xoffSetHome = 150;
    _yoffSetHome = 80;
    _angleHome = -0.2;
    _isOpen = true;
    _xoffSetSecond =122;
    _yoffSetSecond =110;
    _angleSecond = -0.275;
    notifyListeners();
  }
  void openDrawer(){
    _xoffSetHome = 0;
    _yoffSetHome = 0;
    _angleHome = 0;
    _isOpen = false;
    _xoffSetSecond =0;
    _yoffSetSecond =0;
    _angleSecond = 0;
    notifyListeners();
  }
}