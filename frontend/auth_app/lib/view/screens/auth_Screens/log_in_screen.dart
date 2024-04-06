import 'package:auth_app/view/screens/auth_Screens/sign_in_Screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../widgets/mytext.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: primarycolor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/icons/wise.png")),
          ),
          Positioned(
              top: 300,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Mytext(
                        text: "login",
                        title: true,
                        bold: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "type a valid email";
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.grey[400],
                          suffixIcon: Icon(Icons.email),
                          filled: true,
                          label: Mytext(
                            text: "email",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "type a valid password";
                          } else if (value.length < 8)
                            return "the passowrd must containt more then 8 characters";
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.grey[400],
                          suffixIcon: Icon(Icons.password_outlined),
                          filled: true,
                          label: Mytext(
                            text: "password",
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Mytext(text: "forget?"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor: secondrycolor,
                            ),
                            child: Mytext(
                              bold: true,
                              color: Colors.white,
                              text: "sign in >|",
                            )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Mytext(text: "Or"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    backgroundColor: Color(0xffF1F5F9)),
                                onPressed: () {},
                                child: Mytext(
                                  text: "Google",
                                )),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    backgroundColor: Color(0xffF1F5F9)),
                                onPressed: () {},
                                child: Mytext(
                                  text: "Facbook",
                                )),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Mytext(text: "Don't have account"),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SigninScreen(),
                                    ));
                              },
                              child: Mytext(
                                text: "sing in",
                                bold: true,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}