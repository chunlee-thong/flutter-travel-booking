import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_travel_booking/constant/values.dart';
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

  Widget onImageLoading(context, Widget child, ImageChunkEvent progress) {
    if (progress == null) return child;
    return Container(
      padding: EdgeInsets.only(left: 32, top: 64),
      child: CircularProgressIndicator(value: progress.expectedTotalBytes != null ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes : null),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              //activity info
              Container(
                margin: EdgeInsets.only(left: 32),
                child: Card(
                  elevation: 3,
                  shape: roundedRect16,
                  child: Padding(
                    padding: EdgeInsets.only(left: size.width / 3, top: 12, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        buildInfo(),
                        Text(widget.activity.description),
                        buildRating(),
                        buildTimeRow(),
                      ],
                    ),
                  ),
                ),
              ),
              //left image
              Container(
                margin: EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Image.network(
                    widget.activity.image,
                    width: size.width / 3,
                    height: 200,
                    fit: BoxFit.cover,
                    loadingBuilder: onImageLoading,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Text(
            widget.activity.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: titleStyle,
          ),
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
    );
  }

  Widget buildRating() {
    return Container(
      child: RatingBar(
        initialRating: widget.activity.rating,
        direction: Axis.horizontal,
        itemCount: 5,
        itemSize: 14,
        unratedColor: Colors.black,
        itemPadding: EdgeInsets.only(right: 4.0),
        ignoreGestures: true,
        itemBuilder: (context, index) => Icon(Icons.star, color: Colors.orangeAccent),
        onRatingUpdate: (rating) {},
      ),
    );
  }

  Widget buildTimeRow() {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          Card(
            shape: roundedRect12,
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('9:00am'),
            ),
          ),
          Card(
            shape: roundedRect12,
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('11:00am'),
            ),
          ),
        ],
      ),
    );
  }
}
