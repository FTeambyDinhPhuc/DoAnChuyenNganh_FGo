import 'dart:convert';

import 'package:fgo/constants.dart';
import 'package:fgo/models/place.dart';
import 'package:fgo/models/place_search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PlaceSearchController extends GetxController {
  var searchResults = <PlaceSearch>[].obs;

  late TextEditingController startingAddressController;
  late TextEditingController endAddressController;

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&language=vi&types=geocode&key=$google_map_api_key&components=country:vn'));
    var json = jsonDecode(response.body);

    var jsonResults = json['predictions'] as List;
    return searchResults.value =
        jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<Place> getPlace(String placeId) async {
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$google_map_api_key'));

    var json = jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResult);
  }

  setSelectedLocation(int index, TextEditingController textController) async {
    textController.text = searchResults[index].description;
    searchResults.clear();
  }
}
