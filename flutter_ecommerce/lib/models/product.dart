class Products {
  Products({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.rating,
    required this.numReviews,
    required this.price,
    required this.countInStock,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String name;
  late final String image;
  late final String description;
  late final int rating;
  late final int numReviews;
  late final int price;
  late final int countInStock;
  late final List<dynamic> reviews;
  late final String createdAt;
  late final String updatedAt;
  
  Products.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    rating = json['rating'];
    numReviews = json['numReviews'];
    price = json['price'];
    countInStock = json['countInStock'];
    reviews = List.castFrom<dynamic, dynamic>(json['reviews']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['description'] = description;
    _data['rating'] = rating;
    _data['numReviews'] = numReviews;
    _data['price'] = price;
    _data['countInStock'] = countInStock;
    _data['reviews'] = reviews;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}