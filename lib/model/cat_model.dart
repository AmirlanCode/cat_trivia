import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Cat {
  @HiveField(0)
  String text;

  Cat({required this.text});

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
  Map<String, dynamic> toJson() => _$CatToJson(this);
}
