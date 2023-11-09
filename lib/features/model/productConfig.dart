import 'package:exchange/icons/icons_enum.dart';

class ProductConfig {
  String title;
  int id;
  int price;
  List<String> imageUrls;
  CategoryConfig category;
  String description;

  ProductConfig({
    required this.title,
    required this.id,
    required this.price,
    required this.imageUrls,
    required this.category,
    required this.description,
  });

  factory ProductConfig.empty() {
    return ProductConfig(
      title: '',
      id: -1,
      price: 0,
      imageUrls: [],
      category: CategoryConfig(name: '', id: -1, image: ''),
      description: '',
    );
  }
}

class CategoryConfig {
  String name;
  int id;
  String image;

  CategoryConfig({
    required this.name,
    required this.id,
    required this.image,
  });
}

class CurrencyConfig {
  String name;
  String nameId;
  IconsEnum image;
  double amount;
  double percentage;
  bool isDrop;

  CurrencyConfig({
    required this.name,
    required this.nameId,
    required this.image,
    required this.amount,
    required this.percentage,
    required this.isDrop,
  });
}