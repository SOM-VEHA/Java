class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? originalPrice;
  final String imageUrl;
  final String category;
  final double rating;
  final int reviewsCount;
  final int salesCount;
  final bool isFreeShipping;
  final int? discountPercentage;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
    required this.category,
    this.rating = 4.5,
    this.reviewsCount = 0,
    this.salesCount = 0,
    this.isFreeShipping = false,
    this.discountPercentage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviewsCount'] as int,
      salesCount: json['salesCount'] as int,
      isFreeShipping: json['isFreeShipping'] as bool,
      discountPercentage: json['discountPercentage'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'originalPrice': originalPrice,
      'imageUrl': imageUrl,
      'category': category,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'salesCount': salesCount,
      'isFreeShipping': isFreeShipping,
      'discountPercentage': discountPercentage,
    };
  }
}
