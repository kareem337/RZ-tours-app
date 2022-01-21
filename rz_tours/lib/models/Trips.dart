enum Trips { IN_CAIRO, OUT_OF_CAIRO, NA }

class Trip {
  String tripid;
  String Trip_name;
  String Trip_description;
  String Location;
  int Trip_price;

  String imagePath;
  Trips Trip_Types;
  bool liked;

  Trip({
    required this.tripid,
    required this.Trip_name,
    required this.Trip_description,
    required this.Location,
    required this.Trip_price,
    required this.imagePath,
    required this.liked,
    required this.Trip_Types,
  });
}
