import 'package:flutter/material.dart';
import 'package:flutter_travel_booking/widgets/city_card.dart';
import 'package:flutter_travel_booking/model/city_model.dart';
import 'package:flutter_travel_booking/model/icon_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Travel Booking'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 64),
              Text('What you would like to find??', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: icons.map((icon) => buildIconRow(icon)).toList(),
              ),
              SizedBox(height: 32),
              Text('Top Destinations', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 24),
              buildCityList(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            title: Text('Flight'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }

  Widget buildIconRow(icon) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: icon.isSelected ? Colors.blue : Colors.blueGrey,
      ),
      child: Center(
        child: IconButton(
          icon: Icon(icon.icon, color: Colors.white, size: 32),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget buildCityList() {
    return Container(
      height: 320,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: cities.length,
        itemBuilder: (BuildContext context, int index) {
          return CityCard(cities[index]);
        },
      ),
    );
  }
}
