// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  String title;
  String path;
  CategoryModel({
    required this.title,
    required this.path,
  });
}

class ProductModel {
  final String title;
  final int price;
  final String imagepath;
  int productCount = 1;
  final String description;
  ProductModel({
    required this.description,
    required this.title,
    required this.price,
    required this.imagepath,
  });
}
