import 'dart:convert';
import 'package:todos_porto_2/core/exceptions/app_exception.dart';
import 'package:todos_porto_2/core/models/login_model.dart';
import 'package:todos_porto_2/core/models/profile_model.dart';
import 'package:todos_porto_2/core/services/main_url.dart';
import 'package:dio/dio.dart';

class AuthApi {
  final MainUrl _mainUrl;
  final Dio _dio;

  AuthApi({Dio? dio, MainUrl? mainUrl}): _dio = dio ?? Dio(), _mainUrl = mainUrl ?? MainUrl();
  Future<LoginModel> login(String username, String password) async {
    // _dio.close();
    String url = "${_mainUrl.mainUrl}/auth/login";
    try {
      Response data = await _dio.post(
        url,
        data: jsonEncode({
          'username': username,
          'password': password,
        }),
      );
      if (data.statusCode != 200) {
        throw NetworkException("Error saat login ${data.data}");
      }
      LoginModel dataLogin = LoginModel.fromJson(data.data);
      _mainUrl.setToken = dataLogin.token;
      return dataLogin;
    } on DioException catch (e) {
      throw NetworkException(e.message ?? "");
    } catch (e) {

      if (e is NetworkException) {
        throw NetworkException(e.message);
      } else {
        throw Exception();
      }
    }
  }

  Future<ProfileModel> getProfile() async {
    String url = "${_mainUrl.mainUrl}/auth/me";
    try {
      Response data = await _dio.get(
        url,
        options:
            Options(headers: {'Authorization': 'Bearer ${_mainUrl.getToken}'}),
      );
      if (data.statusCode != 200) {
        throw NetworkException("Error saat login ${data.data}");
      }
      return ProfileModel.fromJson(data.data);
    } catch (e) {
      if (e is NetworkException) {
        throw NetworkException(e.message);
      } else {
        throw Exception();
      }
    }
  }
}
