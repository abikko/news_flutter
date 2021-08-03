import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Source {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<dynamic, dynamic> toJson() => _$SourceToJson(this);
}
