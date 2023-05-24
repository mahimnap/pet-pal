// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petEnvironment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetEnvironment _$PetEnvironmentFromJson(Map<String, dynamic> json) =>
    PetEnvironment(
      children: json['children'] as bool?,
      dogs: json['dogs'] as bool?,
      cats: json['cats'] as bool?,
    );

Map<String, dynamic> _$PetEnvironmentToJson(PetEnvironment instance) =>
    <String, dynamic>{
      'children': instance.children,
      'dogs': instance.dogs,
      'cats': instance.cats,
    };
