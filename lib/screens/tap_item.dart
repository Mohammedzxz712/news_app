import 'package:flutter/material.dart';

import '../models/SourceDataModel.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;
  TabItem(this.source, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.green, width: 2.5),
      ),
      child: Text(
        source.name ?? "",
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.green,
        ),
      ),
    );
  }
}
