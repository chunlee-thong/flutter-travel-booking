import 'package:flutter/material.dart';
import 'package:flutter_travel_booking/model/activity_model.dart';
import 'package:flutter_travel_booking/model/city_model.dart';
import 'package:flutter_travel_booking/widgets/activity_card.dart';
import 'package:flutter_travel_booking/widgets/city_info.dart';
import 'package:flutter/cupertino.dart';

class DetailPage extends StatefulWidget {
  final CityModel cityModel;
  DetailPage(this.cityModel);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ScrollController scrollController = ScrollController();
  Size size;
  double opacity = 0.0;

  @override
  void initState() {
    scrollController.addListener(scrollListener);
    super.initState();
  }

  scrollListener() {}

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          NestedScrollView(
            controller: scrollController,
            headerSliverBuilder: (context, isScrolled) => [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height / 2.5,
                iconTheme: IconThemeData(color: Colors.black),
                elevation: 0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                pinned: true,
                floating: false,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: buildCityImage(),
                ),
              )
            ],
            body: Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: activities.length,
                      itemBuilder: (context, index) => ActivityCard(activities[index]),
                    ),
                  ),
                ],
              ),
            ),
            //buildCityInfo(),
          ),
          buildAppbar(context),
        ],
      ),
    );
  }

  Widget buildAppbar(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.2),
      child: SafeArea(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Spacer(),
            IconButton(icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
            IconButton(icon: Icon(Icons.menu, color: Colors.white), onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Container buildCityImage() {
    return Container(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: widget.cityModel.image,
              child: Image.network(
                widget.cityModel.image,
                fit: BoxFit.cover,
              ),
            ),
            buildCityInfo(),
          ],
        ),
      ),
    );
  }

  Widget buildCityInfo() {
    return Positioned(
      bottom: 24,
      left: 16,
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(16)),
          color: Colors.black26,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.cityModel.name, style: TextStyle(fontSize: 40, color: Colors.white)),
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
}
