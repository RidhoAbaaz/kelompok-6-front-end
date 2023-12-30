import 'package:flutter/foundation.dart';
import 'package:zoobeta/models/TicketModel.dart';

class FavoritePageModel extends ChangeNotifier {
  late FavoriteListModel _favoritelist;
  final Map<int, int> _itemQuantities = {};

  FavoriteListModel get favoritelist => _favoritelist;

  set favoritelist(FavoriteListModel newList) {
    _favoritelist = newList;
    notifyListeners();
  }

  List<Item> get items => _itemQuantities.keys.map((id) {
        final item =
            _favoritelist.getById(id, quantity: _itemQuantities[id] ?? 1);
        return item;
      }).toList();

  void add(Item item) {
    if (_itemQuantities.containsKey(item.id)) {
      _itemQuantities[item.id] = _itemQuantities[item.id]! + 1;
    } else {
      _itemQuantities[item.id] = 1;
    }
    notifyListeners();
  }

  void remove(Item item) {
    if (_itemQuantities.containsKey(item.id)) {
      _itemQuantities.remove(item.id);
      notifyListeners();
    }
  }

  void increaseQuantity(Item item) {
    if (_itemQuantities.containsKey(item.id)) {
      _itemQuantities[item.id] = _itemQuantities[item.id]! + 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(Item item) {
    if (_itemQuantities.containsKey(item.id) && _itemQuantities[item.id]! > 1) {
      _itemQuantities[item.id] = _itemQuantities[item.id]! - 1;
      notifyListeners();
    }
  }

  void removeItem(Item item) {
    remove(item);
  }

  double calculateTotal() {
    double total = 0.0;
    for (var entry in _itemQuantities.entries) {
      final item = _favoritelist.getById(entry.key);
      total += item.price * entry.value;
    }
    return total;
  }
}
