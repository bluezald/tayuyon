import 'package:flutter/material.dart';

class ProductCategory {
  final String title;
  final List<String> selections;

  ProductCategory({required this.title, required this.selections});
}

class Product {
  final String name;
  final List<String> imageUrls;
  final double cost;
  final String? description;
  final ProductCategory category;

  /// Represents type of product such as shirt, jeans, pet treats, etc.
  // final String productType;

  Product(
      {required this.name,
      required this.imageUrls,
      required this.cost,
      this.description,
      required this.category});
}

class Cart with ChangeNotifier {
  List<OrderItem> itemsInCart = [];

  double get totalCost {
    double total = 0;
    for (var item in itemsInCart) {
      total += item.product.cost;
    }
    return total;
  }

  void add(OrderItem orderItem) {
    itemsInCart.add(orderItem);
    notifyListeners();
  }

  void remove(OrderItem orderItem) {
    // print(orderItem.product.name);
    itemsInCart.remove(orderItem);
    // print(t);
    notifyListeners();
  }
}

class OrderItem {
  Product product;

  /// Selected size of product; This can be null
  String? selectedSize;

  /// Selected color of product; This can be null
  String? selectedColor;

  OrderItem({required this.product, this.selectedSize, this.selectedColor});
}

ProductCategory fruitsProductCategory =
    ProductCategory(title: 'Fruits', selections: []);
ProductCategory vegetablesProductCategory =
    ProductCategory(title: 'Vegetables', selections: []);
ProductCategory meatProductCategory =
    ProductCategory(title: 'Meat', selections: []);

final kGreyBackground = Colors.grey[200];

List<Product> products = [
  Product(
      name: 'Apples',
      imageUrls: [
        'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
        'https://images-na.ssl-images-amazon.com/images/I/71UqhKT2MDL._AC_UX466_.jpg',
        'https://images-na.ssl-images-amazon.com/images/I/81K7OAepB9L._AC_UX466_.jpg',
        'https://images-na.ssl-images-amazon.com/images/I/812T%2Bu00R4L._AC_UX466_.jpg'
      ],
      cost: 10,
      category: fruitsProductCategory),
  Product(
    name: 'Bananas',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/81tpGc13OgL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81oNSlos2tL._AC_UY679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/819ea2vQIjL._AC_UY679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91SH0RB-8dL._AC_UY606_.jpg'
    ],
    cost: 7,
    category: fruitsProductCategory,
  ),
  Product(
    name: 'Lettuce',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/A1lTY32j6gL._AC_UX679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/71JYOHJ%2BS-L._AC_UX522_.jpg',
    ],
    cost: 19.99,
    category: vegetablesProductCategory,
  ),
  Product(
    name: "Carrots",
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/915Io2JEUPL._AC_UX679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91WJgn0FNkL._AC_UX679_.jpg',
    ],
    cost: 29.99,
    category: vegetablesProductCategory,
  ),
  Product(
    name: 'Porkchops',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/911mb8PkHSL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81LDpImWPAL._AC_UX522_.jpg',
    ],
    cost: 16.99,
    category: meatProductCategory,
  ),
  Product(
    name: 'Chicken Menudo Cut',
    imageUrls: [
      'https://images-na.ssl-images-amazon.com/images/I/71lDML8KDQL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/61Ojm-DnojL._AC_UY679_.jpg',
    ],
    cost: 22.99,
    category: meatProductCategory,
  ),
];
