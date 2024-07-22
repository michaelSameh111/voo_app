

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static String? token;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://voorideshare.com/api/',
      receiveDataWhenStatusError: true,
      headers: {
        'auth-token' : token
      }
    ));
  }

  static Future<Response> getData({
    required String url,
    String? token,
    int? id,
    int? orderId,

    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {'auth-token': token ?? '', 'id': id,'order_id' : orderId};
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    var data,
    String? token,
    int? id,
    int? productId,
    int? update,
    int? tripId,
  }) async {
    dio.options.headers = {'auth-token': token ?? '' , 'trip' : id,'tripId' : tripId,'update' : update};
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
