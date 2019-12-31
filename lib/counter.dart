import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int _counter;

  Counter(this._counter);

  int getCounter() => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
  void decrementCounter(){
    _counter--;
    notifyListeners();
  }


}