import 'package:dio/dio.dart';

import '../services/endPoints.dart';

class DioHelper{
  static Dio ? dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: BASEURL,
        receiveDataWhenStatusError: true,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
      ),
    );
  }

  static Future<Response <dynamic> ?> getData({required String url , required Map<String , dynamic> query}) async {
    print(BASEURL + url);
    return await dio?.get(  url  , queryParameters: query );
  }

}