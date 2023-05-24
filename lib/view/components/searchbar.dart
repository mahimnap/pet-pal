import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController locationController;

  const SearchBar(
      {Key? key, required this.controller, required this.locationController})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    double paddingTop = 12.0;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: paddingTop),
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[150],
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none),
              hintText: "Keyword (e.g. Species, Breed, Name, etc.)",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: paddingTop),
          child: TextField(
            controller: widget.locationController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[150],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none),
                hintText: "Location (e.g. Toronto, ON, Canada)",
                prefixIcon: Icon(Icons.location_on)),
          ),
        ),
      ],
    );
  }
}
