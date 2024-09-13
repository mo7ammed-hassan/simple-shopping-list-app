import 'package:flutter/material.dart';
import 'package:internship/core/widgets/add_item_show_dialog.dart';
import 'package:internship/views/widgets/shopping_body.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 202, 167, 248),
        title: const Text(
          'Products',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const ShoppingViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItemShowDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
