import 'package:auth_app/constants.dart';
import 'package:auth_app/services/authservecise/auth_services.dart';
import 'package:auth_app/view/screens/auth_Screens/log_in_screen.dart';
import 'package:auth_app/view/widgets/mytext.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late TextEditingController namecontorller;
  late TextEditingController emailcontorller;
  late TextEditingController passowrdcontorller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namecontorller = TextEditingController();
    emailcontorller = TextEditingController();
    passowrdcontorller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    namecontorller.dispose();
    emailcontorller.dispose();
    passowrdcontorller.dispose();
  }

  GlobalKey<FormState> key = GlobalKey<FormState>();
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
              child: ClipPath(
                clipper: PentagonClipper(),
                child: Container(
                  padding: const EdgeInsets.only(top: 40),
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Form(
                      key: key,
                      child: Column(
                        children: [
                          const Mytext(
                            text: "Signin",
                            title: true,
                            bold: true,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: namecontorller,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              fillColor: Colors.grey[400],
                              suffixIcon: const Icon(Icons.person),
                              filled: true,
                              label: const Mytext(
                                text: "name",
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: emailcontorller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "type a valid email";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              fillColor: Colors.grey[400],
                              suffixIcon: const Icon(Icons.email),
                              filled: true,
                              label: const Mytext(
                                text: "email",
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: passowrdcontorller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "type a valid password";
                              } else if (value.length < 8)
                                return "the passowrd must containt more then 8 characters";
                              return null;
                            },
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              fillColor: Colors.grey[400],
                              suffixIcon: const Icon(Icons.password_outlined),
                              filled: true,
                              label: const Mytext(
                                text: "password",
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Mytext(text: "forget?"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (key.currentState!.validate()) {
                                    AuthServices.signup(context,
                                        name: namecontorller.text,
                                        email: emailcontorller.text,
                                        password: passowrdcontorller.text);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  backgroundColor: secondrycolor,
                                ),
                                child: const Mytext(
                                  bold: true,
                                  color: Colors.white,
                                  text: "sign in >|",
                                )),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Mytext(text: "Or"),
                          ),
                          const SizedBox(
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
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        backgroundColor: const Color(0xffF1F5F9)),
                                    onPressed: () {},
                                    child: const Mytext(
                                      text: "Google",
                                    )),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        backgroundColor: const Color(0xffF1F5F9)),
                                    onPressed: () {},
                                    child: const Mytext(
                                      text: "Facbook",
                                    )),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Align(
                                alignment: Alignment.center,
                                child: Mytext(text: "have account"),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          const loginScreen(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        var begin = const Offset(-1.0,
                                            0.0); // Slide from left to right
                                        var end = Offset.zero;
                                        var curve = Curves.easeInOut;
                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));
                                        var offsetAnimation =
                                            animation.drive(tween);
                                        return SlideTransition(
                                          position: offsetAnimation,
                                          child: child,
                                        );
                                      },
                                    ));
                                  },
                                  child: const Mytext(
                                    text: "login",
                                    bold: true,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class PentagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 9);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height / 9);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
