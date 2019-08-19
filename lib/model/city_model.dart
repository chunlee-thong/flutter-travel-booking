class CityModel {
  String name;
  String country;
  String image;
  String description;
  int activities;

  CityModel({this.name, this.image, this.activities, this.country, this.description});
}

List<CityModel> cities = [
  CityModel(
    name: 'Venice',
    country: 'Italy',
    activities: 120,
    description: 'Enjoy best trip from top travel agencies at best price for this trip',
    image: 'https://www.telegraph.co.uk/content/dam/Travel/Destinations/Europe/Italy/Venice/venice-restaurants-2.jpg?imwidth=450',
  ),
  CityModel(
    name: 'Paris',
    activities: 20,
    country: 'France',
    description: 'Enjoy best trip from top travel agencies at best price for this trip',
    image: 'https://www.telegraph.co.uk/content/dam/Travel/2018/May/paris.jpg?imwidth=450',
  ),
  CityModel(
    name: 'Phnom penh',
    activities: 190,
    country: 'Cambodia',
    description: 'Enjoy best trip from top travel agencies at best price for this trip',
    image: 'https://s-ec.bstatic.com/images/hotel/max1024x768/187/187206953.jpg',
  ),
];
