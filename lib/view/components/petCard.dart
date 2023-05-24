import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:petpalui/core/models/pet.dart';
import 'package:petpalui/view/pages/petProfilePage.dart';

class PetCardBuilder extends StatelessWidget {
     PetCardBuilder({
      super.key,
      required this.pets,
   });

   final List<Pet> pets;

   void _goToPetProfile(BuildContext context, int value) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PetProfile(petId: value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (itemBuilder, index) => _getCards(itemBuilder, index, context),
        itemCount: pets.length,
    );
  }

  Widget? _getCards(itemBuilder, index, BuildContext context) {

    String imageUri = 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/2760ab96352685.5eac47879b914.jpg';
    if(pets[index].photos!.isNotEmpty) {
      imageUri = pets[index].photos![0].medium;
    }

    return Container(
        padding: const EdgeInsets.fromLTRB(0, 28, 0, 28),
        margin: const EdgeInsets.fromLTRB(17, 0, 17, 0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        ),
    child:GestureDetector(
      onTap: () => _goToPetProfile(context, pets[index].id),   //TODO: pass the pet id
      child: Card(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             Container(
              height: 250,
               width: double.infinity,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 image: DecorationImage(
                   image: NetworkImage(imageUri),
                   fit: BoxFit.cover,
                 ),
               ),
               /* child: Padding(
                 padding: EdgeInsets.all(7.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Align(
                       alignment: Alignment.topRight,
                       child: Icon(
                         Icons.favorite_border,
                         size: 30,
                         color: Colors.red,
                       ),
                     )
                   ],
                 ),
               ) -- removing favorites feature */
             ),
          SizedBox(
            height: 7,
            width: double.infinity,
          ),
          Row(
            children: [
              Text("Meet ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(pets[index].name ?? 'No Name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
          Row(
            children: [
              Text(pets[index].age ?? 'No Age', style: TextStyle(fontSize: 16)),
              Text("  |  ", style: TextStyle(fontSize: 16),),
              Text(pets[index].gender ?? 'No Gender', style: TextStyle(fontSize: 16)),
              Text("  |  ", style: TextStyle(fontSize: 16),),
              Text(pets[index].breeds.primary ?? 'No Breed', style: TextStyle(fontSize: 16)),
            ],
          )
        ],
      )
    )),
    );
  }
}