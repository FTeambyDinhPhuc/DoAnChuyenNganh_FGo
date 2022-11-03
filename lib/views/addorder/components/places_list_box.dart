import 'package:fgo/constants.dart';
import 'package:fgo/controllers/place_search_controller.dart';
import 'package:flutter/material.dart';

class PlacesListBox extends StatelessWidget {
  const PlacesListBox(
      {Key? key,
      required this.placeSearchcontroller,
      required this.textController})
      : super(key: key);

  final PlaceSearchController placeSearchcontroller;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding / 2),
      child: ListView.builder(
        itemCount: placeSearchcontroller.searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              placeSearchcontroller.searchResults[index].description,
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              placeSearchcontroller.setSelectedLocation(index, textController);
            },
          );
        },
      ),
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultCircular),
        color: Colors.teal.shade200,
      ),
    );
  }
}
