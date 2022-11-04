class ProductDetails {
  int id;
  int price;
  String title;
  List images;
  String category;
  String descriptions;
  int stock;
  String thumbnail;

  ProductDetails({
    required this.category,
    required this.descriptions,
    required this.id,
    required this.images,
    required this.price,
    required this.title,
    required this.stock,
    required this.thumbnail,
  });
}
