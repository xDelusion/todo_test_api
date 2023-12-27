import 'package:dio/dio.dart';
import 'package:todo_test_api/models/user.dart';
import 'package:todo_test_api/services/client.dart';

class AuthServices {
  Future<String> signup({required User user}) async {
    late String token;
    try {
      Response response = await Client.dio.post('/signup', data: user.toJson());
      token = response.data["token"];
    } catch (error) {
      throw error.toString();
    }
    return token;
  }

  Future<String> signin({required User user}) async {
    late String token;
    try {
      Response response = await Client.dio.post('/signin', data: user.toJson());
      token = response.data["token"];
    } catch (error) {
      throw error.toString();
    }
    return token;
  }
}
