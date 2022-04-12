import 'package:flutter/material.dart';
import 'package:flutter_travel_booking/constant/values.dart';
import 'package:flutter_travel_booking/model/city_model.dart';
import 'package:flutter_travel_booking/model/icon_model.dart';
import 'package:flutter_travel_booking/widgets/city_card.dart';
import 'package:flutter_travel_booking/widgets/content_title.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1;
  int? _selectedIcon = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: AppBar().preferredSize.height * 1.5),
              const Text('What you would like to find??', style: headerStyle),
              const SizedBox(height: 32),
              buildIconRow(),
              const ContentTitle(title: 'Top Destinations'),
              buildCityList(),
              const ContentTitle(title: 'Exclusive Hotels'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  Widget buildBottomAppBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.flight), label: 'Flight'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }

  Widget buildIconRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List<Widget>.generate(
        icons.length,
        (int index) {
          return ChoiceChip(
            selectedColor: Colors.blueAccent.withOpacity(0.2),
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icons[index].icon,
                color: _selectedIcon == index ? Colors.blue : Colors.black,
              ),
            ),
            selected: _selectedIcon == index,
            onSelected: (bool selected) {
              setState(() {
                _selectedIcon = selected ? index : index;
              });
            },
          );
        },
      ).toList(),
    );
  }

  Widget buildCityList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: kCitiesList.length,
        itemBuilder: (BuildContext context, int index) {
          return CityCard(city: kCitiesList[index]);
        },
      ),
    );
  }
}
