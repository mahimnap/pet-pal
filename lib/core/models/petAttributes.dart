import "package:json_annotation/json_annotation.dart";

part "petAttributes.g.dart";

@JsonSerializable()
class PetAttributes {
  @JsonKey(name: 'spayed_neutered')
  bool? spayedNeutered;
  @JsonKey(name: 'house_trained')
  bool? houseTrained;
  bool? declawed;
  @JsonKey(name: 'special_needs')
  bool? specialNeeds;
  @JsonKey(name: 'shots_current')
  bool? shotsCurrent;

  PetAttributes({
    this.spayedNeutered,
    this.houseTrained,
    this.declawed,
    this.specialNeeds,
    this.shotsCurrent,
  });

  factory PetAttributes.fromJson(Map<String, dynamic> json) =>
      _$PetAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$PetAttributesToJson(this);
}
