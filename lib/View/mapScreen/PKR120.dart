import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PKR120 extends StatelessWidget {
  const PKR120({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xbe1da702),
          borderRadius: BorderRadius.circular(20.0),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     blurRadius: 10,
          //     offset: Offset(4, 8), // Shadow position
          //   ),
          // ]
        ),
        height: size.height * 0.05,
        width: size.width * 0.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "PKR 120 outstanding",
              style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.info_outline_rounded),
          ],
        ),
      ),
    );
  }
}
