// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      id: json['id'] as int,
      organizationId: json['organization_id'] as String,
      type: json['type'] as String,
      species: json['species'] as String?,
      breeds: Breed.fromJson(json['breeds'] as Map<String, dynamic>),
      colors: PetColor.fromJson(json['colors'] as Map<String, dynamic>),
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      size: json['size'] as String?,
      coat: json['coat'] as String?,
      attributes:
          PetAttributes.fromJson(json['attributes'] as Map<String, dynamic>),
      environment:
          PetEnvironment.fromJson(json['environment'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PetPhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      publishedAt: json['published_at'] as String?,
      contact: PetContact.fromJson(json['contact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
      'type': instance.type,
      'species': instance.species,
      'breeds': instance.breeds,
      'colors': instance.colors,
      'age': instance.age,
      'gender': instance.gender,
      'size': instance.size,
      'coat': instance.coat,
      'attributes': instance.attributes,
      'environment': instance.environment,
      'tags': instance.tags,
      'name': instance.name,
      'description': instance.description,
      'photos': instance.photos,
      'published_at': instance.publishedAt,
      'contact': instance.contact,
    };
