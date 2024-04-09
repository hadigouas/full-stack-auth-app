import 'package:auth_app/view/screens/home_scree.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthServices {
  static Dio dio = Dio(BaseOptions(
    baseUrl: "http://172.30.48.1:3000",
  ));
  static Future<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>>
      signup(BuildContext context,
          {required String name,
          required String email,
          required String password}) async {
    try {
      var response = await dio.post("/api/signup",
          data: {"name": name, "email": email, "password": password});
      print(response.data);
      switch (response.statusCode) {
        case 201:
          print('The user connected successfully');
          return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('The user connected successfully')),
          );
        case 400:
          return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.data["msg"] ?? 'Bad request')),
          );
        case 500:
          return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text(response.data['error'] ?? 'Internal server error')),
          );
        default:
          return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An unexpected error occurred')),
          );
      }
    } catch (e) {
      print('Exception occurred: $e');
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred $e')),
      );
    }
  }

  //login service
  static Future<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>>
      login(BuildContext context,
          {required String email, required String password}) async {
    try {
      var response = await dio
          .post("/api/login", data: {"email": email, "password": password});
      print("====================${response.data}============");
      switch (response.statusCode) {
        case 201:
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
          return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('The user connected successfully')),
          );

        case 400:
          return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.data["msg"] ?? 'Bad request')),
          );
        case 500:
          return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text(response.data['error'] ?? 'Internal server error')),
          );
        default:
          return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An unexpected error occurred')),
          );
      }
    } catch (e) {
      print('Exception occurred: $e');
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred $e')),
      );
    }
  }
}
