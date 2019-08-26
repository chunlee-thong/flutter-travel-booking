import 'package:flutter/material.dart';
import 'package:flutter_travel_booking/constant/values.dart';
import 'package:flutter_travel_booking/pages/detail_page.dart';
import 'package:flutter_travel_booking/model/city_model.dart';
import 'package:flutter_travel_booking/widgets/city_info.dart';

class CityCard extends StatefulWidget {
  final CityModel city;
  CityCard(this.city);

  @override
  _CityCardState createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500))..forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void viewCity(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(widget.city)));
  }

  Widget onImageLoading(context, Widget child, ImageChunkEvent progress) {
    if (progress == null) return child;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: CircularProgressIndicator(value: progress.expectedTotalBytes != null ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes : null),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.6;
    return ScaleTransition(
      scale: CurvedAnimation(parent: animationController, curve: Curves.easeInToLinear),
      child: Container(
        margin: EdgeInsets.only(right: 8),
        width: cardWidth,
        child: InkWell(
          onTap: () => viewCity(context),
          customBorder: roundedRect16,
          child: Stack(
            children: <Widget>[
              buildInfoCard(context, cardWidth),
              buildImageCard(cardWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(context, cardWidth) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 150,
        width: cardWidth,
        child: Card(
          elevation: 3,
          shape: roundedRect12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '${widget.city.activities} activities',
                  style: titleStyle,
                ),
                SizedBox(height: 8),
                Text(
                  widget.city.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: subtitleStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImageCard(cardWidth) {
    return Container(
      width: cardWidth,
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        shape: roundedRect16,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Hero(
                  tag: widget.city.image,
                  child: Image.network(
                    widget.city.image,
                    fit: BoxFit.cover,
                    loadingBuilder: onImageLoading,
                  ),
                ),
              ),
              CityInfo(widget.city),
            ],
          ),
        ),
      ),
    );
  }
}
