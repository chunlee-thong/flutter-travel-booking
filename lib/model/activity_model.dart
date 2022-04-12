class Activity {
  String name;
  String description;
  double rating;
  String image;
  double price;
  Activity({
    required this.description,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
  });
}

List<Activity> kActivitiesList = [
  Activity(
    name: 'St.Mark Basilica',
    description: 'Sightseeing tour',
    rating: 2.0,
    image: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-540x360/06/6b/74/cf.jpg',
    price: 30,
  ),
  Activity(
    name: 'Walking tour gondola ride',
    description: 'Swimming tour',
    rating: 3.0,
    image: 'https://img.rezdy.com/PRODUCT_IMAGE/18829/venice_gondolas_750x450__kavalenkava_lg.jpg',
    price: 310,
  ),
  Activity(
    name: 'Murano and Burano Tour',
    description: 'Shopping tour',
    image: 'https://media.tacdn.com/media/attractions-splice-spp-674x446/07/98/b8/9c.jpg',
    rating: 4.0,
    price: 125,
  ),
];
