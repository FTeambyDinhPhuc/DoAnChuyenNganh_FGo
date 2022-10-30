import 'dart:convert';

import 'package:fgo/constants.dart';
import 'package:fgo/models/place_search_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PlaceSearchController extends GetxController {
  var searchResults = <PlaceSearch>[].obs;

  var sourceLocation = ''.obs;
  var destination = ''.obs;

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$google_map_api_key'));
    var json = jsonDecode(response.body);

    var jsonResults = json['predictions'] as List;
    return searchResults.value =
        jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }
}
