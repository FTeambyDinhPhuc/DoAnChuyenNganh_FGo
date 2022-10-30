import 'package:fgo/constants.dart';
import 'package:fgo/controllers/place_search_controller.dart';
import 'package:flutter/material.dart';

class PlacesListBox extends StatelessWidget {
  const PlacesListBox(
      {Key? key,
      required PlaceSearchController controller,
      required this.returnPlace})
      : _controller = controller,
        super(key: key);

  final PlaceSearchController _controller;
  final String returnPlace;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding / 2),
      child: ListView.builder(
        itemCount: _controller.searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _controller.searchResults[index].description,
              style: Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              _controller.searchResults[index].description = returnPlace;
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
