import 'package:flutter/material.dart';
import 'package:flutter_travel_booking/model/activity_model.dart';

class ActivityCard extends StatefulWidget {
  final Activity activity;
  ActivityCard(this.activity);

  @override
  _ActivityCardState createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000))..forward();
    animation = new Tween(begin: 1.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticOut,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var titleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => Transform(
        //axis: Axis.vertical,
        transform: Matrix4.translationValues(animation.value * 400, 0.0, 0.0),
        child: Container(
          margin: EdgeInsets.only(bottom: 16),
          height: 200,
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 32),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    side: BorderSide(width: 0.1, color: Colors.black),
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
                              child: Text(widget.activity.name, overflow: TextOverflow.ellipsis, maxLines: 2, style: titleStyle),
                            ),
                            Flexible(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text('\$' + widget.activity.price.toString(), style: titleStyle),
                                  Text('Per person'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(widget.activity.description, style: TextStyle(color: Colors.black54)),
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
                    widget.activity.image,
                    width: size.width / 3,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
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
