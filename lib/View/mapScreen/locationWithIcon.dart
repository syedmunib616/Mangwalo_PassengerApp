import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationWithIcon extends StatelessWidget {
  const LocationWithIcon({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Color(0xd88d8d8d),
                  blurRadius: 10,
                  offset: Offset(4, 8), // Shadow position
                ),
              ]),
          height: size.height * .06,
          width: size.width * .9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Colors.green,
                size: 40,
              ),
              Container(
                height: 40,
                width: size.width * .7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Progressive Square, Pakistan Employees Co-Operative Housing Society Block 6 PECHS, Karachi",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "--Sindh, Karachi",
                      style: GoogleFonts.lato(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.favorite_border_rounded,
                color: Colors.green,
                size: 37,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
