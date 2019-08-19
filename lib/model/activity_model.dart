class Activity {
  String name;
  String description;
  double rating;
  double price;
  Activity({this.description, this.name, this.price, this.rating});
}

List<Activity> activities = [
  Activity(
    name: 'St.Mark Basilica',
    description: 'Sightseeing tour',
    rating: 4.0,
    price: 30,
  ),
  Activity(
    name: 'Walking tour gondola ride',
    description: 'Sightseeing tour',
    rating: 4.0,
    price: 310,
  ),
  Activity(
    name: 'Murano and Burano Tour',
    description: 'Sightseeing tour',
    rating: 5.0,
    price: 125,
  ),
];
