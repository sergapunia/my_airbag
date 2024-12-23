import 'package:flutter/material.dart';

class ButtonWithMenu extends StatelessWidget {
  ButtonWithMenu({
    super.key,
    required this.items,
    required this.title,
    required this.onTap,
  });
  List<String> items;
  String title;
  Function(String) onTap;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        itemBuilder: (context) {
          return items.map((e) => itemContainer(e)).toList();
        });
  }

  PopupMenuItem itemContainer(String item) {
    return PopupMenuItem(
      onTap: () {
        onTap(item);
      },
      child: Text(item),
    );
  }
}
