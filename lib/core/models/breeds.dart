import "dart:ffi";

import "package:json_annotation/json_annotation.dart";

part "breeds.g.dart";

@JsonSerializable()
class Breed {
  String? primary;
  String? secondary;
  bool? mixed;
  bool? unknown;

  Breed({this.primary, this.secondary, this.mixed, this.unknown});

  factory Breed.fromJson(Map<String, dynamic> json) => _$BreedFromJson(json);
  Map<String, dynamic> toJson() => _$BreedToJson(this);
}
