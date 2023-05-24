import 'package:flutter/material.dart';
import 'package:petpalui/core/models/pet.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:petpalui/view/pages/petProfile.dart';

class SearchTileBuilder extends StatelessWidget {
  final List<Pet> pets;

  final unescape = HtmlUnescape();

  SearchTileBuilder({
    super.key,
    required this.pets,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _getTiles,
      itemCount: pets.length,
    );
  }

  Widget _getTiles(BuildContext context, int index) {
    String imageUri =
        'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2760ab96352685.5eac47879b914.jpg';

    if (pets[index].photos!.isNotEmpty) {
      imageUri = pets[index].photos![0].medium;
    }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PetProfile(pet: pets[index]),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 28, 0, 28),
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        ),
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(backgroundImage: NetworkImage(imageUri), radius: 28),
            ],
          ),
          title: Text(pets[index].name ?? 'No Name'),
          subtitle: Text(
            _formatString(pets[index].description ?? 'No Description'),
            style: const TextStyle(
              height: 1.5,
            ),
          ),
          /*trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.favorite),
            ],
          ),*/
        ),
      ),
    );
  }

  String _formatString(String description) {
    final String descriptionSubstring = description.length > 48
        ? description.substring(0, 48).trim()
        : description.trim();

    final String cleanDescription =
        descriptionSubstring.replaceAll(RegExp('\\s+'), ' ');

    final String htmlDecodedDescription = unescape.convert(cleanDescription);

    return htmlDecodedDescription.replaceAll(RegExp('&#39;'), '\'');
  }
}
