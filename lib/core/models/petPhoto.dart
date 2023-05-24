import "package:json_annotation/json_annotation.dart";

part "petPhoto.g.dart";

@JsonSerializable()
class PetPhoto {
  String small =
      "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2760ab96352685.5eac47879b914.jpg";
  String medium =
      "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2760ab96352685.5eac47879b914.jpg";
  String large =
      "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2760ab96352685.5eac47879b914.jpg";
  String full =
      "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2760ab96352685.5eac47879b914.jpg";

  PetPhoto(this.small, this.medium, this.large, this.full);

  factory PetPhoto.fromJson(Map<String, dynamic> json) =>
      _$PetPhotoFromJson(json);
  Map<String, dynamic> toJson() => _$PetPhotoToJson(this);
}
