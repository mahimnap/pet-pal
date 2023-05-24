import 'package:flutter/material.dart';

class FilterRow extends StatefulWidget {
  const FilterRow({super.key});

  @override
  State<FilterRow> createState() => _YellowBirdState();
}

class _YellowBirdState extends State<FilterRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 242, 135, 21),
            ),
            onPressed: () {},
            child: Text('Breed'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 242, 135, 21),
            ),
            onPressed: () {},
            child: Text('Species'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 242, 135, 21),
            ),
            onPressed: () {},
            child: Text('Gender'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 242, 135, 21),
            ),
            onPressed: () {},
            child: Text('Age'),
          ),
        ],
      ),
    );
  }
}
