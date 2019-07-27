import 'package:flutter/material.dart';

class FactItem extends StatelessWidget {
  final IconData icon;
  final String fact;

  FactItem(this.icon, this.fact);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 30.0,
            color: Colors.green,
          ),
          Container(padding: EdgeInsets.only(left: 8.0), child: Text(fact))
        ],
      ),
    );
  }
}
