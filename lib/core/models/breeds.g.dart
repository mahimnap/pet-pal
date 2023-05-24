// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Breed _$BreedFromJson(Map<String, dynamic> json) => Breed(
      primary: json['primary'] as String?,
      secondary: json['secondary'] as String?,
      mixed: json['mixed'] as bool?,
      unknown: json['unknown'] as bool?,
    );

Map<String, dynamic> _$BreedToJson(Breed instance) => <String, dynamic>{
      'primary': instance.primary,
      'secondary': instance.secondary,
      'mixed': instance.mixed,
      'unknown': instance.unknown,
    };
