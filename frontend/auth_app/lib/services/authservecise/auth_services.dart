import 'package:auth_app/logic/get%20user%20data/cubit/user_data_cubit.dart';
import 'package:auth_app/view/screens/home_scree.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_shered_preference/pro_shered_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  static Dio dio = Dio(BaseOptions(
    baseUrl: "http://172.17.0.1:3000",
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
            const SnackBar(content: Text('The user connected successfully')),
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
            const SnackBar(content: Text('An unexpected error occurred')),
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
      // print("====================${response.data}============");
      switch (response.statusCode) {
        case 201:
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("token", response.data["token"]);
          print(prefs.getString("token"));
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
          return ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('The user connected successfully')),
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
            const SnackBar(content: Text('An unexpected error occurred')),
          );
      }
    } catch (e) {
      print('Exception occurred: $e');
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred $e')),
      );
    }
  }

  static void getuserdata(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    try {
      if (token == null) {
        preferences.setString("token", "");
      } else {
        var resopnse = await dio.post("/tokenisvalid",
            options: Options(headers: <String, dynamic>{
              'Content-Type': 'application/json; charset=UTF-8',
              'token': token
            }));
        if (resopnse.data == true) {
          var userdata = await dio.get("/",
              options: Options(headers: <String, dynamic>{
                'Content-Type': 'application/json; charset=UTF-8',
                'token': token
              }));
          print(userdata.data);
          BlocProvider.of<UserDataCubit>(context).getuserdata(userdata.data);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
