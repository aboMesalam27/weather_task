import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// using this key when we don't have direct access with Build context

/// This class is used for handling 401
/// other errors handling in Api Result Generic class
class TokenInterceptor extends Interceptor {
  final Dio dio;


  TokenInterceptor(this.dio);
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (kDebugMode) {
      print("API>>>>>>>>>>>>>>>>>>>>>>>API");
      print("Request: ${options.uri}");
      print("Request: ${options.queryParameters}");
    }

    // You can modify the request here if needed
    return handler.next(options);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.data != null) {
      if (response.statusCode != 200) {
        final message = response.data["message"] ?? response.data["error"];
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }

    if (response.statusCode == 401 && (response.realUri.path != "/api/login")) {
      if (kDebugMode) {
        print("Session Expired");
      }
      Fluttertoast.showToast(
        msg: response.data["message"] ?? response.data["error"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    // Handle the response
    return handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.type == DioExceptionType.connectionError) {
      Fluttertoast.showToast(msg: "Please check your connection");
    }
    // Handle the error
    if (kDebugMode) {
      print("Error: ${err.response?.data}");
    }

    return handler.next(err);
  }
}
