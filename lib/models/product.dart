class Product {
  final String id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'] ?? 'Không có tên',
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
      category: json['category'] ?? 'Chung',
      // DummyJSON dùng 'thumbnail', FakeStore dùng 'image'
      image: json['thumbnail'] ?? json['image'] ?? 'https://via.placeholder.com/150',
    );
  }
}
