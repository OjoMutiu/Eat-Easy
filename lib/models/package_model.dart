import 'package:eat_easy/models/table_model.dart';

import 'food_model.dart';

class PackageModel {
  late String _package, _description, _image;
  late double? _rating;
  late double _price;
  late List<FoodModel>? _food;
  TableModel? _table;

  ///Constructor
  PackageModel({
    required String package,
    required description,
    required image,
    required price,
    rating,
    table,
    food,
  }) {
    _package = package;
    _description = description;
    _image = image;
    _rating = rating;
    _price = price;
    _food = food;
    _table = table;
  }

  ///getters
  String get package => _package;
  String get description => _description;
  get image => _image;
  get rating => _rating;
  get price => _price;
  List<FoodModel> get food => _food!;
  TableModel get table => _table!;

  ///setters
  set table(TableModel value) {
    _table = value;
  }

  set rating(var value) {
    _rating = value;
  }

  //Other Methods
}

//Demo Data
List<Map<String, dynamic>> recommendation = [
  {
    "image": "assets/images/recommend1.jpg",
    "rating": 4.7,
    "package": "Family Package",
    "description": "1 large table 6 chairs",
    "price": 260.0,
    "food": food,
  },
  {
    "image": "assets/images/recommend2.jpg",
    "rating": 4.9,
    "package": "Single Breakfast",
    "description": "1 table 1 chairs",
    "price": 50.0
  },
  {
    "image": "assets/images/recommend3.jpg",
    "rating": 4.9,
    "package": "Date Package",
    "description": "1 table 2 chairs",
    "price": 99.0
  },
  {
    "image": "assets/images/recommend2.jpg",
    //"rating": 4.9,
    "package": "Single Breakfast",
    "description": "1 table 1 chairs",
    "price": 50.0
  }
];
List<Map<String, dynamic>> recentlySearched = [
  {
    "image": "assets/images/recommend1.jpg",
    "rating": 4.7,
    "package": "Family Package",
    "description": "1 large table 6 chairs",
    "price": 260.0
  },
  {
    "image": "assets/images/recommend2.jpg",
    "rating": 4.9,
    "package": "Single Breakfast",
    "description": "1 table 1 chairs",
    "price": 50.0
  },
];
