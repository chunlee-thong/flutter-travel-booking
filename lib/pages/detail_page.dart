import 'package:flutter/material.dart';
import 'package:flutter_travel_booking/model/activity_model.dart';
import 'package:flutter_travel_booking/model/city_model.dart';
import 'package:flutter_travel_booking/widgets/activity_card.dart';
import 'package:flutter_travel_booking/widgets/city_info.dart';

class DetailPage extends StatefulWidget {
  final CityModel cityModel;
  DetailPage(this.cityModel);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  buildCityImage(),
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: activities.length,
                      itemBuilder: (context, index) {
                        return ActivityCard(activities[index]);
                      },
                    ),
                  ),
                ],
              ),
              buildCityInfo(),
              buildAppbar(context),
            ],
          ),
        ),
      ),
    );
  }

  Row buildAppbar(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        Spacer(),
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        IconButton(icon: Icon(Icons.menu), onPressed: () {}),
      ],
    );
  }

  Positioned buildCityInfo() {
    return Positioned(
      top: 180,
      left: 16,
      child: Container(
        color: Colors.black45,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.cityModel.name, style: TextStyle(fontSize: 54, color: Colors.white)),
            Row(
              children: <Widget>[
                Icon(Icons.flight_takeoff, color: Colors.white),
                SizedBox(width: 8),
                Text(widget.cityModel.country, style: TextStyle(fontSize: 24, color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildCityImage() {
    return Container(
      height: 300,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        child: Image.network(
          widget.cityModel.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
