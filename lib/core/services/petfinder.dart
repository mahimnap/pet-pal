import 'dart:async';
import 'dart:convert';

import 'package:petpalui/core/models/pet.dart';
import 'package:petpalui/core/services/petFinderClient.dart';

class PetFinderService {
  final PetFinderClient petFinderOAuth = PetFinderClient();
  final String petFinderBaseEndpoint = 'https://api.petfinder.com/v2';

  // TODO: Create a better error handling system
  FutureOr<String> _onError(dynamic error) {
    print(error);
    return '';
  }

  /// Returns a list of pets from the PetFinder API
  Future<List<Pet>> getPets() async {
    final String jsonResponse = await petFinderOAuth
        .getData(Uri.parse('$petFinderBaseEndpoint/animals'))
        .catchError(_onError);

    final List<Map<String, dynamic>> petList =
        List.from((jsonDecode(jsonResponse)['animals']) as List);

    return _cleanResponseList(petList.map((pet) => Pet.fromJson(pet)).toList());
  }

  Future<List<Pet>> searchPets(String query, {String? location}) async {
    String url = '$petFinderBaseEndpoint/animals?';

    if (query.isNotEmpty) {
      url += 'q=${Uri.encodeComponent(query)}&';
    }

    if (location != null && location.isNotEmpty) {
      url += 'location=${Uri.encodeComponent(location)}&';
    }

    final String jsonResponse =
        await petFinderOAuth.getData(Uri.parse(url)).catchError(_onError);

    final List<Map<String, dynamic>> petList =
        List.from((jsonDecode(jsonResponse)['animals']) as List);

    return _cleanResponseList(petList.map((pet) => Pet.fromJson(pet)).toList());
  }

  /// Returns a single pet from the PetFinder API based on the pet's id
  Future<Pet> getPet(int petId) async {
    final String jsonResponse = await petFinderOAuth
        .getData(Uri.parse('$petFinderBaseEndpoint/animals/$petId'))
        .catchError(_onError);

    final Map<String, dynamic> petJson = jsonDecode(jsonResponse)['animal'];
    return Pet.fromJson(petJson);
  }

  /// Cleans the response from the PetFinder API
  ///
  /// Removes any pets that do not have a name or description
  List<Pet> _cleanResponseList(List<Pet> pets) {
    return pets
        .where((pet) => pet.name != null || pet.name!.isNotEmpty)
        .where((pet) => pet.description != null)
        .toList();
  }
}
