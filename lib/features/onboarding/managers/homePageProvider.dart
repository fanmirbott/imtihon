import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:imtihon/data/models/HomePageModel.dart';

import '../../../core/utils/cleint.dart';

class HomePageProvider extends ChangeNotifier{

  HomePageProvider(){
    getCategories();
  }
  bool isLoading = false;
  List<HomePageModel> categories = [];
  Future<void> getCategories() async {
    isLoading = true;
    notifyListeners();
    Response response = await dio.get("/categories/list");
    categories = (response.data as List)
        .map((item) => HomePageModel.fromJson(item))
        .toList();
    isLoading = false;
    notifyListeners();
  }
}