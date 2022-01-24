enum Trips { IN_CAIRO, OUT_OF_CAIRO, NA }

class Trip {
   String Trip_name;
   String tid;
   String Trip_description;
   String Location;
   int Trip_price;
   String pl;
   String imagePath;
   Trips Trip_Types;
   bool liked;

  Trip({
    required this.tid,
    required this.Trip_name,
    required this.Trip_description,
    required this.Location,
    required this.Trip_price,
    required this.imagePath,
    required this.liked,
    required this.Trip_Types,
    required this.pl
  });

  
}
