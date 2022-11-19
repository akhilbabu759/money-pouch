import 'package:hive_flutter/adapters.dart';
part 'category_model.g.dart';
@HiveType(typeId: 2)
enum CategoryType{
  @HiveField(0)
  income ,
  @HiveField(1)
  expense,
}

@HiveType(typeId: 1)
class CategoryModel{
  @HiveField(0)
   int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final bool isDeleted;
  @HiveField(3)
  final CategoryType type;

  CategoryModel({required this.name, required this.type,required this.id, this.isDeleted=false } );

}