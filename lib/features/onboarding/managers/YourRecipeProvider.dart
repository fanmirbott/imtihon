import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:imtihon/data/models/YourRecipeModel.dart';
import '../../../core/utils/cleint.dart';

class YourRecipeProvider extends ChangeNotifier {
  YourRecipeProvider() {
    getRecipe();
  }

  bool isLoading = false;
  List<YourRecipeModel> yourRecipe = [];

  Future<void> getRecipe() async {
    isLoading = true;
    notifyListeners();
    Response response = await dio.get("recipes/list?Limit=2");
    yourRecipe = (response.data as List)
        .map((item) => YourRecipeModel.fromJson(item))
        .toList();
    isLoading = false;
    notifyListeners();
  }
}
