import "package:json_annotation/json_annotation.dart";
import "package:petpalui/core/models/breeds.dart";
import 'package:petpalui/core/models/petAttributes.dart';
import 'package:petpalui/core/models/petColor.dart';
import 'package:petpalui/core/models/petContact.dart';
import 'package:petpalui/core/models/petEnvironment.dart';
import 'package:petpalui/core/models/petPhoto.dart';

part 'pet.g.dart';

@JsonSerializable()
class Pet {
  int id;

  @JsonKey(name: "organization_id")
  String organizationId;
  String type;
  String? species;
  Breed breeds;
  PetColor colors;
  String? age;
  String? gender;
  String? size;
  String? coat;

  PetAttributes attributes;
  PetEnvironment environment;
  List<String>? tags;
  String? name;
  String? description;
  List<PetPhoto>? photos;

  @JsonKey(name: "published_at")
  String? publishedAt;

  PetContact contact;

  Pet({
    required this.id,
    required this.organizationId,
    required this.type,
    this.species,
    required this.breeds,
    required this.colors,
    this.age,
    this.gender,
    this.size,
    this.coat,
    required this.attributes,
    required this.environment,
    this.tags,
    this.name,
    this.description,
    this.photos,
    this.publishedAt,
    required this.contact,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
  Map<String, dynamic> toJson() => _$PetToJson(this);
}
