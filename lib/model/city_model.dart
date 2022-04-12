class CityModel {
  String name;
  String country;
  String image;
  String description;
  int activities;

  CityModel({
    required this.name,
    required this.image,
    required this.activities,
    required this.country,
    required this.description,
  });
}

List<CityModel> kCitiesList = [
  CityModel(
    name: 'Venice',
    country: 'Italy',
    activities: 120,
    description: 'Enjoy best trip from top travel agencies at best price for this trip',
    image:
        'https://www.telegraph.co.uk/content/dam/Travel/Destinations/Europe/Italy/Venice/venice-restaurants-2.jpg?imwidth=450',
  ),
  CityModel(
    name: 'Paris',
    activities: 20,
    country: 'France',
    description: 'Visit the most popular city in the world',
    image: 'https://www.telegraph.co.uk/content/dam/Travel/2018/May/paris.jpg?imwidth=450',
  ),
  CityModel(
    name: 'Phnom Penh',
    activities: 90,
    country: 'Cambodia',
    description: 'Experience the cultural of cambodia',
    image: 'https://s-ec.bstatic.com/images/hotel/max1024x768/187/187206953.jpg',
  ),
  CityModel(
    name: 'Siem Reap',
    activities: 240,
    country: 'Cambodia',
    description: 'Explore the ancient temple and cultural village',
    image:
        'https://img.traveltriangle.com/blog/wp-content/tr:w-700,h-400/uploads/2018/05/ta-prohm-Angkor-Thom-siem-reap.jpg',
  ),
];
