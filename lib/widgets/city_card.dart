import 'package:flutter/material.dart';
import 'package:flutter_travel_booking/pages/detail_page.dart';
import 'package:flutter_travel_booking/model/city_model.dart';

class CityCard extends StatelessWidget {
  final CityModel city;
  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.6;
    return Container(
      margin: EdgeInsets.only(right: 16),
      //color: Colors.amberAccent,
      width: cardWidth,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Container(
              height: 150,
              width: cardWidth,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DetailPage(city);
                    }));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '${city.activities} activities',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            city.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black38),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: cardWidth,
            height: 220,
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(child: Image.network(city.image, fit: BoxFit.cover)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
