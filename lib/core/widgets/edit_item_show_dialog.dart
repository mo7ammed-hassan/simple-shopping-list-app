import 'package:flutter/material.dart';
import 'package:internship/controller/item_controller.dart';
import 'package:internship/models/item_model.dart';
import 'package:provider/provider.dart';

Future<dynamic> editItemShowDialog(
    BuildContext context, ItemModel item, int index) {
  final itemController = Provider.of<ItemController>(context, listen: false);
  itemController.nameController.text = item.name;
  itemController.priceController.text = item.price;
  return showDialog(
    context: context,
    builder: (context) {
      return Consumer<ItemController>(
        builder: (context, itemController, child) => AlertDialog(
          title: const Text('edit to Cart'),
          content: Form(
            key: itemController.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  controller: itemController.nameController,
                  decoration: const InputDecoration(
                    hintText: 'name',
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Price is required';
                    }
                    return null;
                  },
                  controller: itemController.priceController,
                  decoration: const InputDecoration(
                    hintText: 'price',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 190, 145, 248).withOpacity(0.5),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 171, 117, 241),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: const Color.fromARGB(255, 190, 145, 248)
                        .withOpacity(0.7),
                  ),
                ),
              ),
              onPressed: () {
                if (itemController.formKey.currentState!.validate()) {
                  itemController.updateItem(index);

                  Navigator.pop(context);
                }
              },
              child: const Text('Edit'),
            ),
          ],
        ),
      );
    },
  );
}
