import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/utils/cleint.dart';
import '../../../data/models/RecentlyAddedModel.dart';

class RecentlyAddedProvider extends ChangeNotifier {
  RecentlyAddedProvider() {
    getRecentlyAdded();
  }

  bool isLoading = false;
  List<RecentlyAddedModel> recentlyAdded = [];

  Future<void> getRecentlyAdded() async {
    isLoading = true;
    notifyListeners();
    Response response = await dio.get("recipes/list?Category=2&Limit=2");
    recentlyAdded = (response.data as List)
        .map((item) => RecentlyAddedModel.fromJson(item))
        .toList();
    isLoading = false;
    notifyListeners();
  }
}
