import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todos_porto_2/core/models/login_model.dart';

import '../../helper/json_helper.dart';

void main() {
  group("Model Test", () {
    String path = "helper/dummies_data/login_resp.json";
    String username = "lgronaverp";
    test('Login model from json', () async {
      //arrange
      final data = await jsonDecode(readJson(path));
      //act
      final result = LoginModel.fromJson(data);
      //assert
      expect(result, isA<LoginModel>());
      expect(result.username, username);
    });
  });
  
}
