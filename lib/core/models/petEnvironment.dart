import "package:json_annotation/json_annotation.dart";

part "petEnvironment.g.dart";

@JsonSerializable()
class PetEnvironment {
  bool? children;
  bool? dogs;
  bool? cats;

  PetEnvironment({
    this.children,
    this.dogs,
    this.cats,
  });

  factory PetEnvironment.fromJson(Map<String, dynamic> json) =>
      _$PetEnvironmentFromJson(json);
  Map<String, dynamic> toJson() => _$PetEnvironmentToJson(this);
}
