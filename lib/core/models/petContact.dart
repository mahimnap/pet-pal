import "package:json_annotation/json_annotation.dart";

part "petContact.g.dart";

@JsonSerializable()
class PetContact {
  String? email;
  String? phone;
  Address? address;

  PetContact({this.email, this.phone, this.address});

  factory PetContact.fromJson(Map<String, dynamic> json) =>
      _$PetContactFromJson(json);
  Map<String, dynamic> toJson() => _$PetContactToJson(this);
}

@JsonSerializable()
class Address {
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;

  Address({
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
