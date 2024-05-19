import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todos_porto_2/core/exceptions/app_exception.dart';
import 'package:todos_porto_2/core/services/auth_api.dart';
import 'package:dio/dio.dart';
import 'package:todos_porto_2/core/models/login_model.dart';

import '../../helper/mock_helper.mocks.dart';

void main() {
  late AuthApi authApi;
  late MockDio mockDio;
  late MockMainUrl mockMainUrl;

  setUp(() {
    mockDio = MockDio();
    mockMainUrl = MockMainUrl();
    authApi = AuthApi(dio: mockDio, mainUrl: mockMainUrl);
  });

  group("AuthAPI", () {
    const username = "lgronaverp";
    const password = "4a1dAKDv9KB9";
    const url = "https://dummyjson.com/auth/login";
    final loginResponse = {
      "id": 26,
      "username": "lgronaverp",
      "email": "lgronaverp@cornell.edu",
      "firstName": "Griffin",
      "lastName": "Braun",
      "gender": "male",
      "image": "https://robohash.org/Griffin.png?set=set4",
      "token":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYsInVzZXJuYW1lIjoibGdyb25hdmVycCIsImVtYWlsIjoibGdyb25hdmVycEBjb3JuZWxsLmVkdSIsImZpcnN0TmFtZSI6IkdyaWZmaW4iLCJsYXN0TmFtZSI6IkJyYXVuIiwiZ2VuZGVyIjoibWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvR3JpZmZpbi5wbmc_c2V0PXNldDQiLCJpYXQiOjE3MTYwOTExMTQsImV4cCI6MTcxNjA5NDcxNH0.uxzX-8T2Hkqr2GGkpYxvt2T77bsIKjI546tP6AtVPro"
    };

    test('Login and return LoginModel', () async {
      when(mockMainUrl.mainUrl).thenReturn('https://dummyjson.com');
      when(mockDio.post(url,
              data: jsonEncode({'username': username, 'password': password})))
          .thenAnswer((realInvocation) async => Response(
              requestOptions: RequestOptions(path: url),
              data: loginResponse,
              statusCode: 200));
      final result = await authApi.login(username, password);

      expect(result, isA<LoginModel>());
      expect(result.username, username);
      verify(mockMainUrl.setToken = result.token).called(1);
    });

    test('throws NetworkException on Dio Error', () async {
      when(mockMainUrl.mainUrl).thenReturn('https://dummyjson.com');
      when(mockDio.post(url,
              data: jsonEncode({"username": username, "password": password})))
          .thenAnswer((realInvocation) async => Response(
              requestOptions: RequestOptions(path: url),
              data: "error",
              statusCode: 400));
      expect(() => authApi.login(username, password),
          throwsA(isA<NetworkException>()));
    });
  });
}
