class Merchant {
  final String title;
  final String image;

  Merchant({required this.title, required this.image});
}

class Product {
  final String title;
  final String image;
  final double price;
  final double discount;

  Product({
    required this.title,
    required this.image,
    required this.price,
    required this.discount,
  });
}
