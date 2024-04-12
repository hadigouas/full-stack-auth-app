import 'package:auth_app/constants.dart';
import 'package:auth_app/view/screens/auth_Screens/sign_in_Screen.dart';
import 'package:auth_app/view/widgets/mytext.dart';
import 'package:flutter/material.dart';

class Welcome_Screen extends StatelessWidget {
  const Welcome_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Image.asset("assets/icons/wise.png"),
            const Mytext(
              text: "Welcom to EcoWise",
              bold: true,
              title: true,
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            const Mytext(
              color: Colors.white,
              text:
                  " your gide to optimize and decrease \n      you re energy use in the house",
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SigninScreen(),
                        ));
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
                    text: "get started >|",
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
