import "package:json_annotation/json_annotation.dart";

part "petColor.g.dart";

@JsonSerializable()
class PetColor {
  String? primary;
  String? secondary;
  String? tertiary;

  PetColor({this.primary, this.secondary, this.tertiary});

  factory PetColor.fromJson(Map<String, dynamic> json) =>
      _$PetColorFromJson(json);
  Map<String, dynamic> toJson() => _$PetColorToJson(this);
}
