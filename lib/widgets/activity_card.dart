import 'package:flutter/material.dart';
import 'package:flutter_travel_booking/model/activity_model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  ActivityCard(this.activity);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var titleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      height: 200,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 32),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: size.width / 3, top: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Text(activity.name, overflow: TextOverflow.ellipsis, maxLines: 2, style: titleStyle),
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('\$' + activity.price.toString(), style: titleStyle),
                              Text('Per person'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(activity.description, style: TextStyle(color: Colors.black54)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List<Widget>.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 6.0, bottom: 6.0, right: 2),
                          child: Icon(Icons.star, color: Colors.orangeAccent, size: 14),
                        );
                      }),
                    ),
                    buildTimeRow(),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image.network(
                activity.image,
                width: size.width / 3,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTimeRow() {
    return Row(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          color: Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('9:00am'),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          color: Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('11:00am'),
          ),
        ),
      ],
    );
  }
}
