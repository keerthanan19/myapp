import 'package:flutter/material.dart';
import 'package:myapp/models/category.dart';
import 'data_provider.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _category = [];
  bool _isLoading = false;

  List<Category> get category => _category;
  bool get isLoading => _isLoading;

  Future<void> loadCategory() async {
    _isLoading = true;
    notifyListeners();

    final dataProvider = DataProvider();
    _category = await dataProvider.fetchCategories();

    _isLoading = false;
    notifyListeners();
  }
}
