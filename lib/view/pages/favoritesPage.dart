import 'package:flutter/material.dart';
import 'package:petpalui/core/models/pet.dart';
import '../../core/services/petFinder.dart';
import '../components/favouritesTile.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite Pets'),
      ),
      body: FutureBuilder(
        future: PetFinderService().getPets(),
        builder: _favouritesFutureBuilder,
      ),
    );
  }

  Widget _favouritesFutureBuilder(
      BuildContext context, AsyncSnapshot<List<Pet>> snapshot) {
    if (snapshot.hasError) {
      return Center(
        child: Text(snapshot.error.toString()),
      );
    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
      return TileBuilder(
        pets: snapshot.data ?? [],
      );
    } else if (!snapshot.hasData) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return const Center(
        child: Text('No favorites yet!'),
      );
    }
  }
}
