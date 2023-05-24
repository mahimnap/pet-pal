import 'package:flutter/material.dart';
import 'package:petpalui/core/models/pet.dart';
import 'package:petpalui/core/services/petfinder.dart';

class PetProfile extends StatelessWidget {

  const PetProfile({super.key, required this.petId});
  final int petId;

  @override
  Widget build(BuildContext context) {
    //Pet pet = PetFinderService().getPet(petId);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Pet Profile"),
        ),
        body: FutureBuilder(
          future: PetFinderService().getPet(petId),
          builder: _petProfileFutureBuilder,
        )
    );
  }

  Widget _petProfileFutureBuilder(BuildContext context, AsyncSnapshot<Pet> snapshot) {

    if(snapshot.hasError) {
      return Center(
        child: Text(snapshot.error.toString()),
      );
    }else if(!snapshot.hasData) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }else if (snapshot.hasData) {
      Pet pet = snapshot.data!;
      String imageUri = 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2760ab96352685.5eac47879b914.jpg';
      if(pet.photos != null && pet.photos!.isNotEmpty) {
        imageUri = pet.photos![0].medium.toString();
      }
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUri!),
                fit: BoxFit.cover,
              )
            ),
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
                      Text(pet?.name ?? 'No name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    /*  Icon(
                        Icons.favorite_rounded,
                        color: Colors.red,
                      ) - removing favorites feature */
                    ],
                  ),
                  Row(
                    children: [
                      Text(pet?.age ?? 'No Age', style: TextStyle(fontSize: 16)),
                      Text("  |  ", style: TextStyle(fontSize: 16),),
                      Text(pet?.gender ?? 'No Gender', style: TextStyle(fontSize: 16)),
                      Text("  |  ", style: TextStyle(fontSize: 16),),
                      Text(pet?.breeds.primary ?? 'No Breed', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                    width: double.infinity,
                  ),
                  Text(pet?.description ?? 'No description',  style: TextStyle(fontSize: 16)),
                  SizedBox(
                    height: 15,
                    width: double.infinity,
                  ),
                  Row(
                    children: [
                      Text("Status: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Adoptable", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                    width: double.infinity,
                  ),
                  Text("Contact Information: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text("Address: ", style: TextStyle(fontSize: 16)),
                      Text(pet?.contact.address?.address1 ?? 'No address', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("City: ", style: TextStyle(fontSize: 16)),
                      Text(pet?.contact.address?.city ?? 'No city', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("State: ", style: TextStyle(fontSize: 16)),
                      Text(pet?.contact.address?.state ?? 'No state', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                        children: [
                          Text("Postal Code: ", style: TextStyle(fontSize: 16)),
                          Text(pet?.contact.address?.postcode ?? 'No postal code', style: TextStyle(fontSize: 16)),
                        ],
                  ),
                  Row(
                    children: [
                      Text("Country: ", style: TextStyle(fontSize: 16)),
                      Text(pet?.contact.address?.country ?? 'No country', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Phone: ", style: TextStyle(fontSize: 16)),
                      Text(pet?.contact.phone ?? 'No phone', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Email: ", style: TextStyle(fontSize: 16)),
                      Text(pet?.contact.email ?? 'No email', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                    width: double.infinity,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Adopt this pet',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  ],
                )
              ),
            )),
          ]
        ),
    );
    }else{
      return const Center(
        child: Text('No data!'),
      );
    }
  }
}
