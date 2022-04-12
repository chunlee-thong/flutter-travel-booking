import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_travel_booking/constant/values.dart';
import 'package:flutter_travel_booking/model/activity_model.dart';

class ActivityCard extends StatefulWidget {
  final Activity activity;

  const ActivityCard({Key? key, required this.activity}) : super(key: key);

  @override
  _ActivityCardState createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late Size size;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))..forward();
    animation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
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

  Widget onImageLoading(context, Widget child, ImageChunkEvent? progress) {
    if (progress == null) return child;
    return Container(
      color: const Color(0xFFFAFAFA),
      alignment: Alignment.center,
      width: size.width / 3,
      child: const Icon(Icons.image),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => Transform(
        //axis: Axis.vertical,
        transform: Matrix4.translationValues(animation.value * 400, 0.0, 0.0),
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          height: 200,
          child: Stack(
            children: <Widget>[
              //activity info
              Container(
                margin: const EdgeInsets.only(left: 32),
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
                margin: const EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
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
              const Text('Per person'),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildRating() {
    return RatingBar(
      initialRating: widget.activity.rating,
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: 14,
      unratedColor: Colors.black,
      itemPadding: const EdgeInsets.only(right: 4.0),
      ignoreGestures: true,
      onRatingUpdate: (rating) {},
      ratingWidget: RatingWidget(
        full: const Icon(Icons.star, color: Colors.orangeAccent),
        half: const Icon(Icons.star, color: Colors.orangeAccent),
        empty: const Icon(Icons.star_border, color: Colors.orangeAccent),
      ),
    );
  }

  Widget buildTimeRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          Card(
            shape: roundedRect12,
            color: Colors.blue[100],
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('9:00am'),
            ),
          ),
          Card(
            shape: roundedRect12,
            color: Colors.blue[100],
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('11:00am'),
            ),
          ),
        ],
      ),
    );
  }
}
