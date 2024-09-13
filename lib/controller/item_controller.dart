import 'package:flutter/material.dart';
import 'package:internship/models/item_model.dart';

class ItemController extends ChangeNotifier {
  final List<ItemModel> _items = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<ItemModel> get items => List.unmodifiable(_items);

  void addItem() {
    if (_validateForm()) {
      _items.add(
        ItemModel(
          name: nameController.text,
          price: priceController.text,
        ),
      );
      _clearControllers();
      notifyListeners();
    }
  }

  void removeItem(int index) {
    if (_isValidIndex(index)) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  void updateItem(int index) {
    if (_isValidIndex(index) && _validateForm()) {
      _items[index] =
          ItemModel(name: nameController.text, price: priceController.text);
      _clearControllers();
      notifyListeners();
    }
  }

  bool _validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  bool _isValidIndex(int index) {
    return index >= 0 && index < _items.length;
  }

  void _clearControllers() {
    nameController.clear();
    priceController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
