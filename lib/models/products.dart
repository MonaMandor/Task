class Products {
  String? id;
  String? title;
  String? description;
  String? price;
  String? imageUrl;
  bool? isFavorite;

  Products({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.isFavorite,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'];
    description = json['description'];
    price = (json['price'].toString());
    imageUrl = json['image'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }
}
  