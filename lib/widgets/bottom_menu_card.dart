import 'package:flutter/material.dart';

class BottomMenuCard extends StatelessWidget {
  BottomMenuCard({
    super.key,
    required this.icon,
    required this.colorIcon,
    required this.sizeIcon,
    required this.items,
    required this.selectors,
  });
  IconData icon;
  Color colorIcon;
  double sizeIcon;
  List<String> items;
  List<Function(String)> selectors;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.black,
        child: Icon(
          icon,
          size: sizeIcon,
          color: colorIcon,
        ),
        itemBuilder: (context) {
          return items.map((e) {
            return itemContainer(e, selectors[items.indexOf(e)]);
          }).toList();
        });
  }

  PopupMenuItem itemContainer(String item, Function(String) onTap) {
    return PopupMenuItem(
      onTap: () {
        onTap(item);
      },
      child: Text(
        item,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
