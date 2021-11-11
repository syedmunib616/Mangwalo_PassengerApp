import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/model/drivers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

// final getDataFuture =
//     ChangeNotifierProvider<Getdatafromapi>((ref) => Getdatafromapi());

class Getdatafromapi {
  var driverdata;
  // List guddi response;
  List<Need> listofdriers = [];
  Getdatafromapi() {
    getdrivers();
  }

  Circle circlecar1;
  var a;
  var b;
  List<Marker> markerlist = [];
  Marker markercar1;
  Future<Need> getdrivers() async {
    String url =
        'https://guddipart2-default-rtdb.firebaseio.com/users/drivers.json';
    http.Response response = await http.get(Uri.parse(url));
    print("babo sar tap1  ${response.body}");
    final jsondata = json.decode(response.body);

    jsondata.forEach((res, i) async {
      // LatLng latlngcar1 = LatLng(a, b);
      //print("shafiq bhai ka londi ${a} ${b}");
      String urll =
          'https://guddipart2-default-rtdb.firebaseio.com/users/drivers/' +
              res +
              '.json';

      http.Response responsee = await http.get(Uri.parse(urll));
      print("babo sar tap  ${responsee.body}");
      final jsondataa = json.decode(responsee.body);
      var jsoncount = jsondataa['lat'];
      // jsondataa=
      print("guddi bhen ki lori ${jsoncount}");

      markerlist.add(Marker(
        markerId: MarkerId(jsondataa['id']),
        infoWindow: InfoWindow(
            title: "Guddi", snippet: "Malboro, Captain Black, Dunhil"),
        position: LatLng(jsondataa['lat'], jsondataa['lng']),
        // rotation: newLocalData.heading,
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5, 0.5),
      ));

      // print(" babo sar tap  ${res}");

      //icon: BitmapDescriptor.fromBytes(imageDatacar));
      //
      // circlecar1 = Circle(
      // circleId: CircleId("carcar1"),
      // //radius: newLocalData.accuracy,
      // zIndex: 1,
      // strokeColor: Colors.blue,
      // center: res,
      // fillColor: Colors.blue.withAlpha(70));
    });
    // if (response.statusCode == 200) {
    //   var jsonResponse = jsonDecode(response.body);
    //   for (int i = 0; jsonResponse.lenght; i++) {
    //     listofdriers.add(Need.fromJson(jsonResponse[i]));
    //     print("babo sartap $listofdriers");
    //   }
    //
    //   //var itemCount = jsonResponse['si3GymwFAMfsNkJXw3PwsBD4MMI3'];
    //
    //   driverdata = jsonResponse;
    //   print("babo sartap $listofdriers");
    //   //print(' http: guddi data $itemCount.');
    //   //print(' http: guddi response $jsonResponse.');
    // } else {
    //   print('Request failed with status: ${response.statusCode}.');
    // }
    return Need.fromJson(json.decode(response.body));
  }
}
// final jsondata = json.decode(response.body);
// final driver = <Need>[];
// for (var item in jsondata) {
// driver.add(Need.fromJson(item));
// }
// // if (response.statusCode == 200) {
// //   var jsonResponse = jsonDecode(response.body);
// //   for (int i = 0; jsonResponse.lenght; i++) {
// //     listofdriers.add(Need.fromJson(jsonResponse[i]));
// //     print("babo sartap $listofdriers");
// //   }
// //
// //   //var itemCount = jsonResponse['si3GymwFAMfsNkJXw3PwsBD4MMI3'];
// //
// //   driverdata = jsonResponse;
// //   print("babo sartap $listofdriers");
// //   //print(' http: guddi data $itemCount.');
// //   //print(' http: guddi response $jsonResponse.');
// // } else {
// //   print('Request failed with status: ${response.statusCode}.');
// // }
// return driver;
