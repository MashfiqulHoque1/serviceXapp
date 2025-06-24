import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {
  List<dynamic> categories = [];
  List<dynamic> featuredServices = [];
  List<dynamic> sliders = [];
  List<dynamic> providers = [];

  bool isLoading = true;

  Future<void> fetchAllData() async {
    isLoading = true;
    notifyListeners();

    try {
      final responses = await Future.wait([
        http.get(Uri.parse('https://prohandy.xgenious.com/api/v1/categories')),
        http.get(
          Uri.parse('https://prohandy.xgenious.com/api/v1/service/featured'),
        ),
        http.get(
          Uri.parse('https://prohandy.xgenious.com/api/v1/slider-lists'),
        ),
        http.get(
          Uri.parse('https://prohandy.xgenious.com/api/v1/provider-lists'),
        ),
      ]);

      final cat = json.decode(responses[0].body);
      final feat = json.decode(responses[1].body);
      final slid = json.decode(responses[2].body);
      final prov = json.decode(responses[3].body);

      //Show keys in console
      print("-> Categories keys: ${cat.keys}");
      print("-> Featured keys: ${feat.keys}");
      print("-> Sliders keys: ${slid.keys}");
      print("-> Providers keys: ${prov.keys}");

      //Assign based on real keys in the response
      categories = cat['categories'] ?? [];
      featuredServices = feat['all_services'] ?? [];
      sliders = slid['sliders'] ?? [];
      providers = prov['provider_lists'] ?? [];
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
