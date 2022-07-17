import 'package:dio/dio.dart';
import 'package:open_sooq/services/general/network_info_service.dart';

enum RequestType { get, post, put, delete }

String selectedLanguage = "en";

class HttpRepository {
  Future<dynamic> callRequest(
      {required RequestType requestType,
      required String methodName,
      Map<String, dynamic> queryParam = const {},
      Map<String, dynamic>? postBody,
      String contentType = Headers.jsonContentType}) async {
    Response response;
    const baseUrl = 'https://rental-apis.herokuapp.com/';

    if (await NetworkInfoService().isConnected()) {
      final dioClient = Dio()
        ..options = BaseOptions(
          baseUrl: baseUrl,
          followRedirects: false,
          headers: {
            "apikey": "123",
            "user_id": "123",
            "language": selectedLanguage,
          },
          validateStatus: (status) {
            return true;
          },
        );

      switch (requestType) {
        case RequestType.get:
          response = await dioClient.get(
            methodName,
            queryParameters: queryParam,
            options: Options(contentType: contentType),
          );
          break;
        case RequestType.post:
          response = await dioClient.post(
            methodName,
            data: postBody,
            queryParameters: queryParam,
            options: Options(contentType: contentType),
          );
          break;
        case RequestType.delete:
          response = await dioClient.delete(
            methodName,
            data: postBody,
            queryParameters: queryParam,
            options: Options(contentType: contentType),
          );
          break;
        case RequestType.put:
          response = await dioClient.put(
            methodName,
            data: postBody,
            queryParameters: queryParam,
            options: Options(contentType: contentType),
          );
          break;
      }

      return response.data;
    } else {
      print("Please check your internet connection");
      throw Exception("Please check your internet connection");
    }
  }
}
