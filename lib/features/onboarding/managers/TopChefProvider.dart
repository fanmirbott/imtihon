import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:imtihon/data/models/TopChefModel.dart';

import '../../../core/utils/cleint.dart';

class TopChefProvider extends ChangeNotifier {
  TopChefProvider() {
    getChef();
  }

  bool isLoading = false;
  List<TopChefModel> topChef = [];

  Future<void> getChef() async {
    isLoading = true;
    notifyListeners();
    Response response = await dio.get("/top-chefs/list?Limit=4");
    topChef = (response.data as List)
        .map((x) => TopChefModel.fromJson(x))
        .toList();
    isLoading = false;
    notifyListeners();
  }
}
