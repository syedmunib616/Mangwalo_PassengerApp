import 'package:flutter/material.dart';
import 'package:flutter_maps/View/mapScreen/topExitDrawerBtn.dart';

import 'PKR120.dart';
import 'locationWithIcon.dart';

class AppbarLocationAndPKR extends StatelessWidget {
  const AppbarLocationAndPKR({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopExitDrawerbtn(),
          SizedBox(
            height: size.height * 0.02,
          ),
          LocationWithIcon(size: size),
          SizedBox(
            height: size.height * 0.02,
          ),
          PKR120(size: size),
        ],
      ),
    );
  }
}
