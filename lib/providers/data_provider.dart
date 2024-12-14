import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/models/menu_item.dart';
import 'package:myapp/models/modifier.dart';

class DataProvider {
  Future<Map<String, dynamic>> loadJson() async {
    final jsonString = await rootBundle.loadString('assets/data.json');
    return json.decode(jsonString);
  }

  Future<List<dynamic>> fetchMenus() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response);
    var jsonResponse = jsonDecode(response);
    print(jsonResponse);
    return data['Result']['Menu'];
  }

  Future<List<Category>> fetchCategories() async {
    final data = await loadJson();

    print('Raw JSON data for Categories: $data');

    if (data['Result'] == null || data['Result']['Categories'] == null) {
      print('Error: Invalid JSON structure or missing "Categories" key.');
      return [];
    }

    final categoriesJson = data['Result']['Categories'] as List?;

    if (categoriesJson == null || categoriesJson.isEmpty) {
      print("Categories list is null or empty.");
      print('Type of categoriesJson: ${categoriesJson.runtimeType}');
      return [];
    }

    final categories = <Category>[];
    for (var e in categoriesJson) {
      try {
        final category = Category.fromJson(e);
        categories.add(category);
        print("Category title: ${category.title}");
      } catch (e) {
        print("Error parsing category item: $e");
        print("Invalid category item data: $e");
      }
    }

    return categories;
  }

  Future<List<MenuItem>> fetchMenuItems() async {
    final data = await loadJson();
    // Similar error handling and logic as fetchCategories and fetchMenus
    // ... (Implementation for fetching and parsing MenuItems)
    print('Raw JSON data for MenuItems: $data');

    if (data['Result'] == null || data['Result']['MenuItems'] == null) {
      print('Error: Invalid JSON structure or missing "MenuItems" key.');
      return [];
    }

    // ... (Rest of the implementation)
    return []; // Replace with actual MenuItem parsing and return
  }

  Future<List<Modifier>> fetchModifiers() async {
    final data = await loadJson();
    // Similar error handling and logic as fetchCategories and fetchMenus
    // ... (Implementation for fetching and parsing Modifiers)
    print('Raw JSON data for Modifiers: $data');

    if (data['Result'] == null || data['Result']['Modifiers'] == null) {
      print('Error: Invalid JSON structure or missing "Modifiers" key.');
      return [];
    }

    // ... (Rest of the implementation)
    return []; // Replace with actual Modifier parsing and return
  }
}
