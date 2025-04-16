import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiServiceSimulation extends ErrorHandler {
  ApiServiceSimulation(this.baseUrl);

  final Dio _dio = Dio(); // to simulate dio api request
  final String baseUrl;

  final _defaultHeaders = {"accept": "application/json"};

  void initializeDio() async {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: _defaultHeaders,
      connectTimeout:
          kDebugMode ? const Duration(minutes: 1) : const Duration(seconds: 10),
      receiveTimeout:
          kDebugMode ? const Duration(minutes: 1) : const Duration(seconds: 15),
      receiveDataWhenStatusError: true,
      followRedirects: false,
    );
    // dio request
    _dio.options = options;
  }

  /// GET: method
  Function(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  })
  get getRequest => _dio.get;

  /// POST: method
  Function(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  })
  get postRequest => _dio.post;
}

class ErrorHandler {
  ErrorHandler({
    this.code,
    this.status,
    this.message,
    this.timeStamp,
    this.description,
  });

  factory ErrorHandler.fromJson(Map<String, dynamic> json) {
    if (json case {
      "status": String _,
      "message": String _,
      "description": String _,
      "timestamp": String _,
    }) {
      return ErrorHandler(
        status: json["status"],
        message: json["message"],
        description: json["description"],
        timeStamp: DateTime.now(),
      );
    } else if (json is String) {
      throw FormatException("FormatException: 502 Bad Gateway");
    } else {
      return ErrorHandler(
        code: "000",
        message:
            "Unable to establish connection. Please check your internet connection.",
        description:
            "Unable to establish connection. Please check your internet connection.",
      );
    }
  }

  final String? code;
  final String? status;
  final String? message;
  final String? description;
  final DateTime? timeStamp;
}
