import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onItemClicked;
  const MenuItem({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.onItemClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(label),
      onTap: onItemClicked,
    );
  }
}
