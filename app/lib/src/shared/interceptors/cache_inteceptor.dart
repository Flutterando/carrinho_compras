import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    return options;
  }

  @override
  onResponse(Response response) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = response.data is String ? response.data : jsonEncode(response.data);
    prefs.setString(response.request.path, data);
    return response;
  }

  @override
  onError(DioError e) async {
    print(e.request.path);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(e.request.path)) {
      return Dio().resolve(prefs.getString(e.request.path));
    } else {
      return e;
    }
  }
}
