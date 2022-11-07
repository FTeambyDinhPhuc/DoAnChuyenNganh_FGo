import 'dart:convert';

import 'package:fgo/constants.dart';
import 'package:fgo/models/place.dart';
import 'package:fgo/models/place_search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:math' show cos, sqrt, asin;

class PlaceSearchController extends GetxController {
  var searchResultsStrarting = <PlaceSearch>[].obs;
  var searchResultsEnd = <PlaceSearch>[].obs;

  late TextEditingController startingAddressController;
  late TextEditingController endAddressController;

  var idSourceLocation = 'co cai cuc'.obs;
  var idDestinationLocation = ''.obs;

  //vị trí đón
  var sourceLatiTude = 0.0;
  var sourceLongiTude = 0.0;

  //vị trí muốn đến
  var destinationLatiTude = 0.0;
  var destinationLongtiTude = 0.0;

  //list điểm vị trí để vẽ đường
  var polylineCoordinates = <LatLng>[];

  //tìm danh sách place từ textfile nhập vào
  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&language=vi&types=geocode&key=$google_map_api_key&components=country:vn'));
    var json = jsonDecode(response.body);

    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  //lấy place từ idplace nhập vào
  Future<Place> getPlace(String placeId) async {
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$google_map_api_key'));

    var json = jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResult);
  }

  searchEndPlaces() async {
    searchResultsEnd.value = await getAutocomplete(endAddressController.text);
  }

  searchStrartingPlaces() async {
    searchResultsStrarting.value =
        await getAutocomplete(startingAddressController.text);
  }

  setSelectedLocation(int index, TextEditingController textController,
      List<PlaceSearch> searchResults) {
    textController.text = searchResults[index].description;
    String id = searchResults[index].placeId;
    searchResults.clear();
    return id;
  }

  //set vị trí đón
  setViTriDon() async {
    Place place = await getPlace(idSourceLocation.value);
    sourceLatiTude = place.geometry.location.lat;
    sourceLongiTude = place.geometry.location.lng;
  }

  //set vị trí đến
  setViTriDen() async {
    Place place = await getPlace(idDestinationLocation.value);
    destinationLatiTude = place.geometry.location.lat;
    destinationLongtiTude = place.geometry.location.lng;
  }

  getPolyPoints() async {
    polylineCoordinates.clear();
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_map_api_key,
      PointLatLng(sourceLatiTude, sourceLongiTude),
      PointLatLng(destinationLatiTude, destinationLongtiTude),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) =>
          polylineCoordinates.add(LatLng(point.latitude, point.longitude)));
    }
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void tinhKm() {
    double totalDistance = 0;
    for (var i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude);
    }
    print(totalDistance);
  }
}
