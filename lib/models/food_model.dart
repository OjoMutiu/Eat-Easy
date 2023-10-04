class FoodModel {
  late int _id;
  late String _food, _image;
  late double? _rating;
  late double _price;

  get id => _id;
  get food => _food;
  get image => _image;
  get rating => _rating;
  get price => _price;

  FoodModel(
      {required id, required food, required image, required price, rating}) {
    _id = id;
    _food = food;
    _image = image;
    _price = price;
    _rating = rating;
  }

  FoodModel.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _food = json["food"];
    _image = json["image"];
    _price = json["price"];
    _rating = json["rating"];
  }
}

//Demo Food data
List<Map<String, dynamic>> foods = [
  {
    "id": 1,
    "food": "Meatball Sweetie",
    "image": "assets/images/meatball.jpg",
    "price": 63.5,
    "rating": 4.9
  },
  {
    "id": 2,
    "food": "Noodle Ex",
    "image": "assets/images/noodles.jpg",
    "price": 42,
    "rating": 4.8
  },
  {
    "id": 3,
    "food": "Burger Ala Ala",
    "image": "assets/images/burger.jpg",
    "price": 55.5,
    "rating": 4.7
  },
  {
    "id": 4,
    "food": "Chicken Collage",
    "image": "assets/images/chicken_collage.jpg",
    "price": 78.2,
    "rating": 4.5
  },
  {
    "id": 5,
    "food": "Fried Rice Uenak",
    "image": "assets/images/fried_rice.jpg",
    "price": 34,
    "rating": 4.6
  },
  {
    "id": 6,
    "food": "Chocolate Cream",
    "image": "assets/images/chocolate_cream.jpg",
    "price": 23,
    "rating": 4.7
  },
];

//Demo FamilyPackage Food
List<FoodModel> food = [];
