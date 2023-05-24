// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petPhoto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetPhoto _$PetPhotoFromJson(Map<String, dynamic> json) => PetPhoto(
      json['small'] as String,
      json['medium'] as String,
      json['large'] as String,
      json['full'] as String,
    );

Map<String, dynamic> _$PetPhotoToJson(PetPhoto instance) => <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
      'full': instance.full,
    };
