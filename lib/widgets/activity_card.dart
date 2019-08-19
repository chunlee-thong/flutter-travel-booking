import 'package:flutter/material.dart';
import 'package:flutter_travel_booking/model/activity_model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  ActivityCard(this.activity);
  @override
  Widget build(BuildContext context) {
    var titleStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: double.infinity,
      height: 200,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 32),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 150.0, top: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Text(
                            activity.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: titleStyle,
                          ),
                        ),
                        Text('\$' + activity.price.toString(), style: titleStyle),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Text(activity.description),
                        Spacer(),
                        Text('Per person'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Icon(Icons.star, color: Colors.orangeAccent),
                    ),
                    Row(
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
                    )
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
                'https://cdn.mos.cms.futurecdn.net/veQKQrhqeLXwXHw4Q6qM3N-320-80.jpg',
                width: 150,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
