import 'package:posts_app/models/products.dart';

class CartItem {
  Products product;
  int quantity;
  CartItem({
    required this.product,
    required this.quantity,
  });
  double get total {
    var v = double.parse(product.price!);

    return v * quantity;
  }
  //function to convert the data from the database to map

  Map<String, dynamic> toMap() {
    return {
      'id': product.id,
      'name': product.title,
      'price': product.price,
      'image': product.imageUrl,
      'description': product.description,
      'isFavorite': product.isFavorite,
      'quantity': quantity,
    };
  }
  //function to convert the data from the map to object

  factory CartItem.fromMap(Map<dynamic, dynamic> map) {
    return CartItem(
      product: Products(
        id: map['id'],
        title: map['name'],
        price: map['price'],
        imageUrl: map['image'],
        description: map['description'],
        isFavorite: map['isFavorite'],
      ),
      quantity: map['quantity'],
    );
  }
}
