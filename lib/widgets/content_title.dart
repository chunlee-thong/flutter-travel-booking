import 'package:flutter/material.dart';

class ContentTitle extends StatelessWidget {
  final String title;
  ContentTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('See all', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
        ],
      ),
    );
  }
}
