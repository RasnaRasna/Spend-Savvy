import 'package:hive_flutter/adapters.dart';

part 'category_model.g.dart';

@HiveType(typeId: 2)
enum CategoryType {
  @HiveField(0)
  income,

  @HiveField(1)
  expense,
}

@HiveType(typeId: 1)
class CategoryModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final bool isDeleted;

  @HiveField(3)
  final CategoryType type;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.type,
      this.isDeleted = false});
  @override
  String toString() {
    return '{$name $type}';
  }
}

@HiveType(typeId: 3)
class SelectCategory {
  @HiveField(0)
  final String selectcategory;

  SelectCategory({required this.selectcategory});
}

@HiveType(typeId: 4)
class Splashscreens extends HiveObject {
  @HiveField(0)
  int screens;

  Splashscreens({required this.screens});
  static Box<Splashscreens> getdata() =>
      Hive.box<Splashscreens>('Splashscreens');
}
