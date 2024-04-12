import 'package:auth_app/logic/get%20user%20data/cubit/user_data_cubit.dart';
import 'package:auth_app/services/authservecise/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view/screens/auth_Screens/sign_in_Screen.dart';
import 'view/screens/welcom_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => UserDataCubit(),
      ),
    ],
    child: const Authapp(),
  ));
}

class Authapp extends StatefulWidget {
  const Authapp({super.key});

  @override
  State<Authapp> createState() => _AuthappState();
}

class _AuthappState extends State<Authapp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthServices.getuserdata(context);
    print('the function is running');
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider.of<UserDataCubit>(context).user.token.isEmpty
          ? const SigninScreen()
          : const Welcome_Screen(),
    );
  }
}
