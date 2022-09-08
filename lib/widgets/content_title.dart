import 'package:flutter/material.dart';

class ContentTitle extends StatelessWidget {
  final String title;

  const ContentTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          InkWell(
            onTap: () {},
            customBorder: const StadiumBorder(),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
