import 'package:flutter/cupertino.dart';

import '../../../core/utils/cleint.dart';
import '../../../data/models/TrendingRecieModel.dart';

class TrendingProvider extends ChangeNotifier {
  TrendingProvider() {
    getTrending();
  }

  bool isLoading = false;
  List<TrendingRecipeModel> trendingRecipe = [];

  Future<void> getTrending() async {
    isLoading = true;
    notifyListeners();
    final response = await dio.get("recipes/trending-recipe?Limit=1");
     trendingRecipe = [TrendingRecipeModel.fromJson(response.data)];

    isLoading = false;
    notifyListeners();
  }
}
