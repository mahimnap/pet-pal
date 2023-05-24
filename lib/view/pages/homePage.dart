import 'package:flutter/material.dart';
import 'package:petpalui/core/services/petfinder.dart';
import 'package:petpalui/view/pages/petProfilePage.dart';
import 'package:petpalui/core/models/pet.dart';
import '../components/petCard.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: FutureBuilder(
        future: PetFinderService().getPets(),
        builder: _homepageFutureBuilder,
      ),
    );
  }

  Widget _homepageFutureBuilder(
      BuildContext context, AsyncSnapshot<List<Pet>> snapshot) {
    if (snapshot.hasError) {
      return Center(
        child: Text(snapshot.error.toString()),
      );
    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
      return PetCardBuilder(
        pets: snapshot.data ?? [],
      );
    } else if (!snapshot.hasData) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return const Center(
        child: Text('No data!'),
      );
    }
  }


  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Home"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => _goToPetProfile(context),
                      child: Container(
                          width: double.infinity,
                          height: 270.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1543466835-00a7907e9de1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZG9nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment : CrossAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.favorite,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ))),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 80.0,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Meet Max!",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Text(
                              "Young   |   ",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text("Male    |    ",
                                style: TextStyle(fontSize: 20)),
                            Text("Beagle ", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () => _goToPetProfile(context),
                      child: Container(
                          width: double.infinity,
                          height: 270.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1603349136483-c9087327668c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHBlcnNpYW4lMjBjYXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment : CrossAxisAlignment.end,
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
                          ))),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 80.0,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Meet Lily!",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Text(
                              "Young   |   ",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text("Female    |    ",
                                style: TextStyle(fontSize: 20)),
                            Text("Persian ", style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () => _goToPetProfile(context),
                      child: Container(
                          width: double.infinity,
                          height: 270.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1572266071126-492372e7a001?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNjb3R0aXNoJTIwZm9sZCUyMGNhdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment : CrossAxisAlignment.end,
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
                          ))),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 80.0,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Meet Smudge!",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Text(
                              "Young   |   ",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text("Male    |    ",
                                style: TextStyle(fontSize: 20)),
                            Text("Scottish Fold ",
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () => _goToPetProfile(context),
                      child: Container(
                          width: double.infinity,
                          height: 270.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1621262331542-df0768a47e2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGZyZW5jaCUyMGJ1bGxkb2d8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment : CrossAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.favorite,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ))),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 80.0,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Meet Zac!",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Text(
                              "Young   |   ",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text("Male    |    ",
                                style: TextStyle(fontSize: 20)),
                            Text("French Bulldog ",
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }*/
}
