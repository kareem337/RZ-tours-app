enum Trips { IN_CAIRO, OUT_OF_CAIRO }

class Trip {
  final String museum_name;
  final String Trip_description;
  final String Location;
  final String Trip_price;
  final String imagePath;
  final Trips Trip_Types;
  final bool liked;

  Trip({
    required this.museum_name,
    required this.Trip_description,
    required this.Location,
    required this.Trip_price,
    required this.imagePath,
    required this.liked,
    required this.Trip_Types,
  });
}
