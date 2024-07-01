import 'dart:js_interop';

import 'package:dio/dio.dart';

class Api {
  late Dio dio;

  Api() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://example-data.draftbit.com/",
        connectTimeout: const Duration(seconds: 30000),
        receiveTimeout: const Duration(seconds: 30000)
      )
    );
  }

  Future<List<dynamic>> get(String endpoint) async{
    try {
      final Response response = await dio.get(endpoint);
      final a = response.data as List<dynamic>;
      print(a.first);
      final List<dynamic> responseData = validateResponse(response);
      return responseData;
    } on DioException catch(error) {
      throw Exception("Error interno $error");
    }
  }

  // Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async{
  //   try {
  //     final Response response = await dio.post(endpoint, data: body);
  //     final Map<String, dynamic> responseData = validateResponse(response);
  //     return responseData;
  //   } on DioException catch(error) {
  //     throw Exception("Error interno $error");
  //   }
  // }

  List<dynamic> validateResponse(Response response){
    switch(response.statusCode) {
      case 200:
      case 201:
        return response.data as List<dynamic>;
      case 400:
      case 401:
        throw Exception(response.data["error"]).toString();
      case 500:
      default:
        throw Exception("Error en el servidor ${response.statusCode}");
    }
  }
}