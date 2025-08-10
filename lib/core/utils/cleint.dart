import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: 'http://192.168.1.71:8888/api/v1/',
    connectTimeout: Duration(seconds: 3),
    receiveTimeout: Duration(seconds: 5),
  ),

);