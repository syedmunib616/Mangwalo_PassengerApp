
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TopExitDrawerbtn extends StatelessWidget {
  const TopExitDrawerbtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(4, 8), // Shadow position
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.clear,
                size: 35,
              ),
            ),
          ),
        ),
        Spacer(),
        Text(
          'Select pickup location',
          style:
          GoogleFonts.newsCycle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(4, 8), // Shadow position
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.menu,
                size: 35,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
