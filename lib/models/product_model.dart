class ProductModel {
  final String productPackage, description, image;
  final double? rating;
  final double price;

  ProductModel(
      {required this.productPackage,
      required this.description,
      required this.image,
      required this.price,
      this.rating});
}

//Demo Data
List<Map<String, dynamic>> recommendation = [
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
