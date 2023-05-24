import 'package:flutter/material.dart';
import 'package:petpalui/core/models/pet.dart';
import 'package:petpalui/core/services/petfinder.dart';
import 'package:petpalui/view/components/searchBar.dart';
import 'package:petpalui/view/components/searchTile.dart'; // Import the new file

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final PetFinderService _petFinderService = PetFinderService();

  List<Pet> _petList = [];

  void _onSearchPressed() async {
    String query = _searchController.text;
    String location = _locationController.text;
    final pets = await _petFinderService.searchPets(query,
        location: location.isNotEmpty ? location : null);
    print(
        'Results for query "$query" and location "$location": ${pets.length} pets found.');

    setState(() {
      _petList = pets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SearchBar(
                    controller: _searchController,
                    locationController: _locationController),
                SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                    ),
                    onPressed: _onSearchPressed,
                    child: Text('Search'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                SearchTileBuilder(pets: _petList), // Use the SearchTileBuilder
          ),
        ],
      ),
    );
  }
}
