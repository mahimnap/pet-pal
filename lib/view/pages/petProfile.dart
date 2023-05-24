import 'package:flutter/material.dart';
import 'package:petpalui/core/models/pet.dart';

//used for search page tile nav (petprofilepage used for home page tiles)

class PetProfile extends StatelessWidget {
  final Pet pet;

  const PetProfile({
    required this.pet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String imageUri =
        'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2760ab96352685.5eac47879b914.jpg';

    if (pet.photos!.isNotEmpty) {
      imageUri = pet.photos![0].medium;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 300,
                width: 400,
                child: Image(fit: BoxFit.cover, image: NetworkImage(imageUri)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(pet.name ?? 'No Name',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            /*Icon(
                              Icons.favorite_rounded,
                              color: Colors.red[700],
                            )*/
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text('Pet Description:\n${pet.description ?? 'No Description'}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Column( //for pet details
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Type: ${pet.type}'),
                              Text('Species: ${pet.species ?? 'Unknwon'}'),
                              Text('Primary Breed: ${pet.breeds.primary ?? 'Unknown'}'),
                              Text('Secondary Breed: ${pet.breeds.secondary ?? 'N/A'}'),
                              Text('Age: ${pet.age ?? 'Unknown'}'),
                              Text('Gender: ${pet.gender ?? 'Unknown'}'),
                              Text('Size: ${pet.size ?? 'Unknown'}'),
                              Text('Coat: ${pet.coat ?? 'Unknown'}'),
                              Text ('Primary Colour: ${pet.colors.primary ?? 'Unknown'}'),
                              Text ('Secondary Colour: ${pet.colors.secondary ?? 'N/A'}'),
                              Text ('Tertiary Colour: ${pet.colors.tertiary ?? 'N/A'}'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Column( //for pet location and contact information
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Organization ID: ${pet.organizationId}'),
                              Text('Email: ${pet.contact.email ?? 'Unknown'}'),
                              Text('Phone: ${pet.contact.phone ?? 'Unknown'}'),
                              Text('Address: ${pet.contact.address?.address1 ?? 'Unknown'}'),
                              Text('Address 2: ${pet.contact.address?.address2 ?? 'N/A'}'),
                              Text('City: ${pet.contact.address?.city ?? 'Unknown'}'),
                              Text('State: ${pet.contact.address?.state ?? 'Unknown'}'),
                              Text('Postal/Zip Code: ${pet.contact.address?.postcode ?? 'Unknown'}'),
                              Text('Country: ${pet.contact.address?.country ?? 'Unknown'}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


