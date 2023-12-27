import 'package:dio/dio.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(baseUrl: "https://coded-books-api-auth.eapi.joincoded.com"),
  );
}

class NamedRoutes {
  static final String login = "signin";
}
