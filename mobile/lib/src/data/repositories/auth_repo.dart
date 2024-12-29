import 'package:dio/dio.dart';
import 'package:mobile/src/data/models/loginresponse.dart';
import 'package:mobile/src/data/models/user.dart';



class AuthRepository {
  final Dio _dio = Dio();

  Future<Loginresponse> login(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      if (email == "test@example.com" && password == "password123") {
        return Loginresponse(
          token: "fake_token_12345",
          refreshtoken: "fake_refresh_token_12345",
        );
      } else {
        throw Exception('Invalid email or password');
      }
    } catch (e) {
      throw Exception('An error occurred during login: $e');
    }
  }
}
