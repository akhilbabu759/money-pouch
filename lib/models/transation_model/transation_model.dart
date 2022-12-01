import 'package:hive_flutter/adapters.dart';
import 'package:moneypouch/models/category/category_model.dart';
part 'transation_model.g.dart';

@HiveType(typeId:0)
class TransationModel{
  @HiveField(0)
  var  id;
  @HiveField(1)
  final bool isIncome;
  @HiveField(2)
  final int amount;
  @HiveField(3)
  final String category; 
  @HiveField(4)
  final DateTime date;
  TransationModel({required this.amount,required this.category,required this.isIncome,required this.date, required this.id});

}