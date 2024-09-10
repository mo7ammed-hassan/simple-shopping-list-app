import 'package:flutter/material.dart';
import 'package:internship/models/item_model.dart';

class ItemController extends ChangeNotifier {
  List<ItemModel> items = [];

  List<ItemModel> fetchItem() {
    return items;
  }

  void addItem(ItemModel item) {
    items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      notifyListeners();
    }
  }

  void updateItem(int index, ItemModel updatedItem) {
    if (index >= 0 && index < items.length) {
      items[index] = updatedItem;
      notifyListeners();
    }
  }
}
