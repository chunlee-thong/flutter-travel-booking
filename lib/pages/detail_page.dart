import 'package:flutter/material.dart';
import 'package:flutter_travel_booking/constant/values.dart';
import 'package:flutter_travel_booking/model/activity_model.dart';
import 'package:flutter_travel_booking/model/city_model.dart';
import 'package:flutter_travel_booking/widgets/activity_card.dart';

class DetailPage extends StatefulWidget {
  final CityModel city;

  const DetailPage({Key? key, required this.city}) : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ScrollController scrollController = ScrollController();
  late Size size;
  double opacity = 0.0;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
              SliverSafeArea(
                top: false,
                bottom: false,
                sliver: SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height / 2.5,
                  iconTheme: const IconThemeData(color: Colors.black),
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
                ),
              )
            ],
            body: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: kActivitiesList.length,
                    itemBuilder: (context, index) => ActivityCard(activity: kActivitiesList[index]),
                  ),
                ),
              ],
            ),
            //buildCityInfo(),
          ),
          buildAppbar(),
        ],
      ),
    );
  }

  Widget buildAppbar() {
    return Material(
      color: Colors.black.withOpacity(0.2),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            const Spacer(),
            IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
            IconButton(icon: const Icon(Icons.menu, color: Colors.white), onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget buildCityImage() {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: widget.city.image,
              child: Image.network(
                widget.city.image,
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
          shape: roundedRect16,
          color: Colors.black45,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.city.name, style: cityTitleStyle),
            Row(
              children: <Widget>[
                const Icon(Icons.flight_takeoff, color: Colors.white),
                const SizedBox(width: 8),
                Text(widget.city.country, style: const TextStyle(fontSize: 24, color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
