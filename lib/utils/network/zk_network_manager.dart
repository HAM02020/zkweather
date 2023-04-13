import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

class ZKNetworkManager extends DioForNative {
  static final ZKNetworkManager _instance = ZKNetworkManager._init();
  factory ZKNetworkManager() => _instance;
  ZKNetworkManager._init() {
    debugPrint("NetworkManager Init");
    (transformer as BackgroundTransformer).jsonDecodeCallback = parseJson;
    options = BaseOptions(
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
    );
    interceptors.add(ZKInterceptor());
  }

  Future<Response<T>> doGet<T>(url,
      {queryParameters, options, cancelToken, onReceiveProgress}) {
    return get<T>(
      url,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  doPost<T>(url,
      {queryParameters,
      data,
      options,
      cancelToken,
      onSendProgress,
      onReceiveProgress}) {
    return post<T>(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  doUploadFile(url, data) {
    var options = Options(contentType: 'multipart/form-data');
    return doPost(url, options: options, data: data);
  }
}

class ZKInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //添加headers 设置contentType等
    debugPrint(
        "dioRequest:${options.method} url->${options.baseUrl}${options.queryParameters}");
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.resolve(response);
  }
}
