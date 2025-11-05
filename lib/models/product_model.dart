class ProductModel {
  List<Product> products;
  int total;
  int skip;
  int limit;

  ProductModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      products: (json['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList(),
      total: json['total'] ?? 0,
      skip: json['skip'] ?? 0,
      limit: json['limit'] ?? 0,
    );
  }

  get length => null;
}

class Product {
  int id;
  String title;
  String description;
  Category category;
  double price;
  double discountPercentage;
  double rating;
  int stock;
  List<String> tags;
  String? brand;
  String sku;
  int weight;
  Dimensions dimensions;
  String warrantyInformation;
  String shippingInformation;
  AvailabilityStatus availabilityStatus;
  List<Review> reviews;
  ReturnPolicy returnPolicy;
  int minimumOrderQuantity;
  Meta meta;
  List<String> images;
  String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: _categoryFromString(json['category']),
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
      stock: json['stock'] ?? 0,
      tags: List<String>.from(json['tags'] ?? []),
      brand: json['brand'],
      sku: json['sku'] ?? '',
      weight: json['weight'] ?? 0,
      dimensions: Dimensions.fromJson(json['dimensions']),
      warrantyInformation: json['warrantyInformation'] ?? '',
      shippingInformation: json['shippingInformation'] ?? '',
      availabilityStatus: _availabilityFromString(json['availabilityStatus']),
      reviews:
          (json['reviews'] as List?)?.map((e) => Review.fromJson(e)).toList() ??
          [],
      returnPolicy: _returnPolicyFromString(json['returnPolicy']),
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 1,
      meta: Meta.fromJson(json['meta']),
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'] ?? '',
    );
  }

  static Category _categoryFromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'beauty':
        return Category.BEAUTY;
      case 'fragrances':
        return Category.FRAGRANCES;
      case 'furniture':
        return Category.FURNITURE;
      case 'groceries':
        return Category.GROCERIES;
      default:
        return Category.GROCERIES;
    }
  }

  static AvailabilityStatus _availabilityFromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'in stock':
        return AvailabilityStatus.IN_STOCK;
      case 'low stock':
        return AvailabilityStatus.LOW_STOCK;
      default:
        return AvailabilityStatus.IN_STOCK;
    }
  }

  static ReturnPolicy _returnPolicyFromString(String? value) {
    switch (value) {
      case '7 Days Return Policy':
        return ReturnPolicy.THE_7_DAYS_RETURN_POLICY;
      case '30 Days Return Policy':
        return ReturnPolicy.THE_30_DAYS_RETURN_POLICY;
      case '60 Days Return Policy':
        return ReturnPolicy.THE_60_DAYS_RETURN_POLICY;
      case '90 Days Return Policy':
        return ReturnPolicy.THE_90_DAYS_RETURN_POLICY;
      default:
        return ReturnPolicy.NO_RETURN_POLICY;
    }
  }
}

class Dimensions {
  double width;
  double height;
  double depth;

  Dimensions({required this.width, required this.height, required this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: (json['width'] as num?)?.toDouble() ?? 0,
      height: (json['height'] as num?)?.toDouble() ?? 0,
      depth: (json['depth'] as num?)?.toDouble() ?? 0,
    );
  }
}

class Meta {
  DateTime createdAt;
  DateTime updatedAt;
  String barcode;
  String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      barcode: json['barcode'] ?? '',
      qrCode: json['qrCode'] ?? '',
    );
  }
}

class Review {
  int rating;
  String comment;
  DateTime date;
  String reviewerName;
  String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'] ?? 0,
      comment: json['comment'] ?? '',
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
      reviewerName: json['reviewerName'] ?? '',
      reviewerEmail: json['reviewerEmail'] ?? '',
    );
  }
}

enum AvailabilityStatus { IN_STOCK, LOW_STOCK }

enum Category { BEAUTY, FRAGRANCES, FURNITURE, GROCERIES }

enum ReturnPolicy {
  NO_RETURN_POLICY,
  THE_30_DAYS_RETURN_POLICY,
  THE_60_DAYS_RETURN_POLICY,
  THE_7_DAYS_RETURN_POLICY,
  THE_90_DAYS_RETURN_POLICY,
}
