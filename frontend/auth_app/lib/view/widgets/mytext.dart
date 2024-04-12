// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytext extends StatelessWidget {
  const Mytext({
    super.key,
    required this.text,
    this.bold = false,
    this.title = false,
    this.color = Colors.black,
  });
  final String text;
  final bool bold;
  final bool title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontSize: title ? 32 : 14,
        overflow: TextOverflow.ellipsis,
        color: color,
      )),
    );
  }
}
