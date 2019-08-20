import 'package:flutter/material.dart';
import 'package:flutter_travel_booking/model/city_model.dart';

class CityInfo extends StatelessWidget {
  final CityModel city;
  CityInfo(this.city);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.black45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(city.name, style: TextStyle(fontSize: 24, color: Colors.white)),
          Row(
            children: <Widget>[
              Icon(Icons.flight_takeoff, color: Colors.white, size: 14),
              SizedBox(width: 8),
              Text(city.country, style: TextStyle(fontSize: 14, color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
