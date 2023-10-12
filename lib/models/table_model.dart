class TableModel {
  late int _id;
  late String _tableType, _image;
  late double _price;
  late int? _noOfChair;

  get id => _id;
  get tableType => _tableType;
  get image => _image;
  get price => _price;
  get noOfChair => _noOfChair;

  TableModel(
      {required id,
      required tableType,
      required image,
      required price,
      required noOfChair}) {
    _id = id;
    _tableType = tableType;
    _image = image;
    _price = price;
    _noOfChair = noOfChair;
  }

  TableModel.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _tableType = json["tableType"];
    _image = json["image"];
    _price = json["price"];
    _noOfChair = json["noOfChair"];
  }
}

//Demo Table Data
List<Map<String, dynamic>> tables = [
  {
    "id": 1,
    "tableType": "Family Table",
    "image": "assets/images/family_table.jpg",
    "price": 15,
    "noOfChair": 6
  },
  {
    "id": 2,
    "tableType": "Family Table Extra",
    "image": "assets/images/family_table2.png",
    "price": 19,
    "noOfChair": 8
  },
  {
    "id": 3,
    "tableType": "Work Table",
    "image": "assets/images/work_table.jpg",
    "price": 12,
    "noOfChair": 1
  },
  {
    "id": 4,
    "tableType": "Work Meeting Extra",
    "image": "assets/images/meeting_table.jpg",
    "price": 15,
    "noOfChair": 3
  },
  {
    "id": 5,
    "tableType": "Duo Table",
    "image": "assets/images/date_table_2.jpg",
    "price": 15,
    "noOfChair": 6
  },
  {
    "id": 6,
    "tableType": "Date Night Table",
    "image": "assets/images/date_table.jpg",
    "price": 15,
    "noOfChair": 6
  }
];
