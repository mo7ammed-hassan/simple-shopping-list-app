import 'package:flutter/material.dart';
import 'package:internship/controller/item_controller.dart';
import 'package:internship/core/widgets/confirm_show_dialog.dart';
import 'package:internship/views/widgets/card_item.dart';
import 'package:internship/views/widgets/custom_dismissible_ackground.dart';
import 'package:provider/provider.dart';

class ShoppingViewBody extends StatelessWidget {
  const ShoppingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemController>(
      builder: (context, itemController, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: itemController.items.length,
                  itemBuilder: (context, index) => Dismissible(
                    key: ValueKey(itemController.items[index]),
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        return await confirmShowDialog(
                          context,
                          itemController,
                          index,
                        );
                      } else {
                        return false;
                      }
                    },
                    background: const CustomDismissibleBackground(
                      icon: Icons.delete,
                      alignment: Alignment.centerLeft,
                      color: Colors.red,
                    ),
                    secondaryBackground: const CustomDismissibleBackground(
                      icon: Icons.favorite,
                      alignment: Alignment.centerRight,
                      color: Colors.green,
                    ),
                    child: CardItem(
                      item: itemController.items[index],
                      index: index,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
