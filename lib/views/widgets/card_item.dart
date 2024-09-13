import 'package:flutter/material.dart';
import 'package:internship/core/widgets/edit_item_show_dialog.dart';
import 'package:internship/models/item_model.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.item, required this.index});
  final ItemModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14),
        leading: CircleAvatar(
          radius: 25,
          child: Center(
            child: Text((index + 1).toString()),
          ),
        ),
        title: Text(
          item.name,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          '${item.price}\$',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.blueGrey,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            editItemShowDialog(context, item, index);
          },
          icon: const Icon(
            Icons.edit,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
