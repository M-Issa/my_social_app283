import 'package:dio/dio.dart';


class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true, // if error occured
          ),
    );
  }

  ///get function for get data from network when called
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    String lang='en',
  }) async {
    dio.options.headers={
      'lang':lang,
      'Authorization':token??'',
      'Content-Type': 'application/json',
    };
    return await dio.get(url, queryParameters: query);
  }

  ///for login data
  static Future<Response> postData({
    required String url,
    required Map<String,dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
  ///for Update profile
  static Future<Response> putData({
    required String url,
    required Map<String,dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {

    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
