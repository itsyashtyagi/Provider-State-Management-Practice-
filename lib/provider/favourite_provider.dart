import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _favouriteItems = [];

  List<int> get favouirteItems => _favouriteItems;

  void addItems(int value) {
    _favouriteItems.add(value);
    notifyListeners();
  }

  void removeItems(int value) {
    _favouriteItems.remove(value);
    notifyListeners();
  }
}
