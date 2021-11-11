import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_maps/model/drivers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

import 'View/mapScreen/appBarLocationAndPKR.dart';
import 'model/drivers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Maps',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Map Home Page'));
    //    home: Mangwalo());
    // home: DiverOrCustomer());

    //home: Fire());
  }
}

// class Fire extends StatefulWidget {
//   const Fire({Key key}) : super(key: key);
//
//   @override
//   _FireState createState() => _FireState();
// }
//
// class _FireState extends State<Fire> {
//   final fb = FirebaseDatabase.instance;
//
//   var a;
//   var b;
//
//   String num1;
//   String num2;
//
//   @override
//   Widget build(BuildContext context) {
//     final ref = fb.reference();
//     final r = fb.reference().child("users");
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             FlatButton(
//                 onPressed: () {
//                   ref
//                       .child("users")
//                       .child("user1")
//                       .child('lat')
//                       .once()
//                       .then((DataSnapshot data) {
//                     setState(() {
//                       a = data.value;
//                       print('${data.value}');
//                     });
//                   });
//                   ref
//                       .child("users")
//                       .child("user1")
//                       .child("lng")
//                       .once()
//                       .then((DataSnapshot data) {
//                     setState(() {
//                       b = data.value;
//                       print("${data.value}");
//                     });
//                   });
//                 },
//                 child: Text("ok")),
//             Text(a.toString()),
//             Text(b.toString()),
//             SizedBox(
//               height: 50,
//             ),
//             TextField(
//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//               onChanged: (val) {
//                 num1 = val;
//               },
//             ),
//             TextField(
//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//               onChanged: (val) {
//                 num2 = val;
//               },
//             ),
//             FlatButton(
//               onPressed: () {
//                 // r.child("user1").child("lat").set(num);
//                 r.child("user1").set({"lat": num1, "lng": num2});
//               },
//               child: Text("Lat & Lang"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DiverOrCustomer extends StatefulWidget {
//   const DiverOrCustomer({Key key}) : super(key: key);
//   @override
//   _DiverOrCustomerState createState() => _DiverOrCustomerState();
// }
//
// class _DiverOrCustomerState extends State<DiverOrCustomer> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FlatButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Driver()));
//                 },
//                 child: Container(
//                     height: 60,
//                     width: 120,
//                     color: Colors.blue,
//                     child: Center(
//                       child: Text(
//                         "Diver",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ))),
//             FlatButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Mangwalo()));
//                 },
//                 child: Container(
//                     height: 60,
//                     width: 120,
//                     color: Colors.green,
//                     child: Center(
//                       child: Text(
//                         "Customer",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ))),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Driver extends StatefulWidget {
//   const Driver({Key key}) : super(key: key);
//
//   @override
//   _DriverState createState() => _DriverState();
// }
//
// class _DriverState extends State<Driver> {
//   final fb = FirebaseDatabase.instance;
//   var a;
//   var b;
//   String num1;
//   String num2;
//
//   // getloc() async {
//   //   Uint8List imageData = await getMarker();
//   //   var location = await _locationTracker.getLocation();
//   //   updateMarkerAndCircle(location, imageData);
//   //   final r = fb.reference().child("users");
//   //   r.child("user1").set({"lat": location.latitude, "lng": location.longitude});
//   //   print("guddi corrdinates $num1 $num2");
//   // }
//
//   initState() {
//     super.initState();
//     getCurrentLocation();
//     //getloc();
//     // setState(() {
//     //   num1 = lat.toString();
//     //   num2 = lng.toString();
//     //   final ref = fb.reference();
//     //
//     //
//     //   //print("guddi corrdinates $num1 $num2");
//     // });
//   }
//
//   ////////////
//   bool ok = false;
//   StreamSubscription _locationSubscription;
//   Location _locationTracker = Location();
//   Marker marker;
//   Circle circle;
//   GoogleMapController _controller;
//   bool chagetheme = false;
//   double lat, lng;
//
//   static final CameraPosition initialLocation = CameraPosition(
//     target: LatLng(24.860175157177526, 67.0640015602112),
//     zoom: 14.4746,
//   );
//
//   Future<Uint8List> getMarker() async {
//     ByteData byteData =
//         await DefaultAssetBundle.of(context).load("assets/person.png");
//     return byteData.buffer.asUint8List();
//   }
//
//   void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
//     LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
//
//     setState(() {
//       lat = latlng.latitude;
//       lng = latlng.longitude;
//     });
//
//     print("guddi ${lat} $lng");
//
//     this.setState(() {
//       marker = Marker(
//           markerId: MarkerId("home"),
//           position: latlng,
//           rotation: newLocalData.heading,
//           draggable: false,
//           zIndex: 2,
//           flat: true,
//           anchor: Offset(0.5, 0.5),
//           icon: BitmapDescriptor.fromBytes(imageData));
//
//       circle = Circle(
//           circleId: CircleId("car"),
//           radius: newLocalData.accuracy,
//           zIndex: 1,
//           strokeColor: Colors.blue,
//           center: latlng,
//           fillColor: Colors.blue.withAlpha(70));
//     });
//   }
//
//   void getCurrentLocation() async {
//     try {
//       Uint8List imageData = await getMarker();
//       var location = await _locationTracker.getLocation();
//
//       updateMarkerAndCircle(location, imageData);
//
//       final r = fb.reference().child("users");
//       r
//           .child("user2")
//           .set({"lat": location.latitude, "lng": location.longitude});
//       // print("guddi corrdinates $num1 $num2");
//       if (_locationSubscription != null) {
//         _locationSubscription.cancel();
//       }
//
//       _locationSubscription =
//           _locationTracker.onLocationChanged().listen((newLocalData) {
//         if (_controller != null) {
//           _controller
//               .animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
//             bearing: 192.8334901395799,
//             target: LatLng(newLocalData.latitude, newLocalData.longitude),
//             tilt: 0,
//             zoom: 18.00,
//           )));
//           // Marker(
//           //   markerId: MarkerId("munib"),
//           //   position: LatLng(newLocalData.latitude, newLocalData.longitude),
//           //   onTap: showAlertDialog(context),
//           // );
//           updateMarkerAndCircle(newLocalData, imageData);
//         }
//       });
//     } on PlatformException catch (e) {
//       if (e.code == 'PERMISSION_DENIED') {
//         debugPrint("Permission Denied");
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     if (_locationSubscription != null) {
//       _locationSubscription.cancel();
//     }
//     super.dispose();
//   }
//
//   Widget build(BuildContext context) {
//     final ref = fb.reference();
//     final r = fb.reference().child("users");
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Colors.blue,
//       //   title: Text(
//       //     "Map",
//       //     style: GoogleFonts.lato(),
//       //   ),
//       // ),
//
//       body: SafeArea(
//         child: Stack(
//           children: [
//             GoogleMap(
//               mapType: chagetheme == false ? MapType.normal : MapType.hybrid,
//               initialCameraPosition: initialLocation,
//               markers: Set.of((marker != null) ? [marker] : []),
//               circles: Set.of((circle != null) ? [circle] : []),
//               onMapCreated: (GoogleMapController controller) {
//                 _controller = controller;
//               },
//             ),
//
//             // Positioned(
//             //   top: 320,
//             //   left: 150,
//             //   child: ok != true ? mangwaloButton(context) : Container(),
//             // ),
//
//             Positioned(
//                 right: 10,
//                 bottom: 120,
//                 child: Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           if (chagetheme == false) {
//                             chagetheme = true;
//                           } else {
//                             chagetheme = false;
//                           }
//                         });
//                       },
//                       child: Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10.0),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey,
//                                   blurRadius: 10,
//                                   offset: Offset(4, 8), // Shadow position
//                                 ),
//                               ]),
//                           height: size.height * 0.05,
//                           width: size.width * 0.09,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Image.asset('assets/earth.png'),
//                           )),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         getCurrentLocation();
//                         print("munib $marker");
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10.0),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 blurRadius: 10,
//                                 offset: Offset(4, 8), // Shadow position
//                               ),
//                             ]),
//                         height: size.height * 0.05,
//                         width: size.width * 0.09,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Image.asset('assets/currnet.png'),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )),
//             Positioned(
//               top: 0,
//               right: 2,
//               left: 2,
//               child:
//                   //ok != true ? Container() :
//                   AppbarLocationAndPKR(size: size),
//             ),
//             Positioned(
//               bottom: 10,
//               right: 70,
//               child:
//                   //ok != true ? Container() :
//                   bottomBtnWithFares(size),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Container bottomBtnWithFares(Size size) {
//     return Container(
//       height: size.height * 0.15,
//       width: size.width * 0.73,
//       //color: Colors.red,
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Color(0xff222323),
//               borderRadius: BorderRadius.circular(20.0),
//               // boxShadow: [
//               //   BoxShadow(
//               //     color: Colors.grey,
//               //     blurRadius: 10,
//               //     offset: Offset(4, 8), // Shadow position
//               //   ),
//               // ]
//             ),
//             height: size.height * 0.08,
//             width: size.width * 0.6,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Icon(
//                     Icons.stacked_line_chart_sharp,
//                     size: 22,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   "It's busy. Fares are \n higher than usual ",
//                   style: GoogleFonts.lato(fontSize: 19, color: Colors.white),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Icon(
//                     Icons.info_outline_rounded,
//                     size: 22,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           GestureDetector(
//               onTap: () {
//                 getCurrentLocation();
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Color(0xff23a300),
//                     borderRadius: BorderRadius.circular(20.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey,
//                         blurRadius: 10,
//                         offset: Offset(4, 8), // Shadow position
//                       ),
//                     ]),
//                 height: size.height * 0.05,
//                 width: size.width * 0.7,
//                 child: Center(
//                   child: Text(
//                     "Conform Pickup",
//                     style: GoogleFonts.lato(
//                         fontSize: 17, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
//
//   GestureDetector mangwaloButton(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showAlertDialog(context);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Color(0xCEE58100),
//           borderRadius: BorderRadius.circular(40.0),
//           // boxShadow: [
//           //   BoxShadow(
//           //     color: Colors.grey,
//           //     blurRadius: 10,
//           //     offset: Offset(4, 8), // Shadow position
//           //   ),
//           // ]
//         ),
//         height: MediaQuery.of(context).size.height * 0.190,
//         width: MediaQuery.of(context).size.width * 0.3,
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Image.asset("assets/1.png"),
//               Text(
//                 "Tap for Mangwalo",
//                 style: GoogleFonts.dekko(
//                     fontSize: 15, fontWeight: FontWeight.bold),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   showAlertDialog(BuildContext context) {
//     // set up the button
//     Widget okButton = FlatButton(
//       child: Text("OK"),
//       onPressed: () {
//         // Navigator.push(context,
//         //     MaterialPageRoute(builder: (context) => GoogleMapScreen()));
//         setState(() {
//           ok = true;
//           Navigator.pop(context);
//         });
//       },
//     );
//
//     Widget cencel = FlatButton(
//       child: Text("Cencel"),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Row(
//         children: [
//           Text(
//             "Dunhill, ",
//             style: GoogleFonts.patuaOne(),
//           ),
//           Text(
//             "Marlboro, ",
//             style: GoogleFonts.patuaOne(),
//           ),
//           Text(
//             "Captain Black",
//             style: GoogleFonts.patuaOne(),
//           ),
//         ],
//       ),
//       // content: TextFormField(),
//       actions: [okButton, cencel],
//     );
//
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fb = FirebaseDatabase.instance;

  var a;
  var b;
  var c;
  var d;
  String num1;
  String num2;

  // getloc() async {
  //   Uint8List imageData = await getMarker();
  //   var location = await _locationTracker.getLocation();
  //   updateMarkerAndCircle(location, imageData);
  //   final r = fb.reference().child("users");
  //   r.child("user1").set({"lat": location.latitude, "lng": location.longitude});
  //   print("guddi corrdinates $num1 $num2");
  // }

  initState() {
    super.initState();
    getCurrentLocation();
    getdrivers();
    delay();
    //getdrivers();

    //fetchall();
    //getDriveers();
    //initialize();
    //Getdatafromapi().getdrivers();
    //getloc();
    // setState(() {
    //   num1 = lat.toString();
    //   num2 = lng.toString();
    //   final ref = fb.reference();
    //
    //
    //   //print("guddi corrdinates $num1 $num2");
    // });
  }

  delay() async {
    for (int i = 0; i < 100000000; i++) {
      final q = await Future.delayed(Duration(seconds: 1), () {
        print("${[i]}");
        getCurrentLocation();
      });
      i++;
    }
  }

  // initialize() async {
  //   Marker first = Marker(
  //       markerId: MarkerId('guddi'),
  //       position: LatLng(a, b),
  //       infoWindow: InfoWindow(title: 'Guddi'));
  //
  //   await markerslist.addAll({first, marker});
  //   //markerslist.add(first);
  //   //markerslist.add(marker);
  //
  //   setState(() {});
  //   print("guddi bhen ki lori  $a $b");
  //   print("guddi Markers ${markerslist}");
  // }

  ////////////
  bool ok = false;
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  StreamSubscription _locationSubscriptioncar;
  Location _locationTrackercar = Location();
  Marker marker;
  Marker markercar;
  Marker markercar1;
  Circle circle;
  Circle circlecar;
  Circle circlecar1;
  GoogleMapController _controller;
  GoogleMapController _controllercar;
  bool chagetheme = false;
  double lat, lng;
  List<Marker> markerslist = [];

  Completer<GoogleMapController> _completer = Completer();

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(24.860175157177526, 67.0640015602112),
    zoom: 13.80,
  ); // code of response of driver

  List<Marker> mar_kar = [];
  //var driverdata;
  // List guddi response;
  List<Need> listofdrivers = [];
  // getdrivers() async {
  //   String url =
  //       'https://guddipart2-default-rtdb.firebaseio.com/users/drivers.json';
  //
  //   // Await the http get response, then decode the json-formatted response.
  //   var response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body);
  //     var itemCount = jsonResponse['si3GymwFAMfsNkJXw3PwsBD4MMI3'];
  //
  //     for (int i = 0; jsonResponse.lenght; i++) {
  //       listofdrivers.add(Need.fromJson(jsonResponse[i]));
  //       print(listofdrivers.length);
  //     }
  //     //print(' http: guddi data $itemCount.');
  //     //print(' http: guddi response $jsonResponse.');
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }
  //   // print('bhen ki lori guddi $driverdata');
  // }

  List<Marker> markerlist = [];
  Marker markercar2;
  getdrivers() async {
    String url =
        'https://guddipart2-default-rtdb.firebaseio.com/users/drivers.json';
    http.Response response = await http.get(Uri.parse(url));
    print(" ${response.body}");
    final jsondata = json.decode(response.body);

    jsondata.forEach((res, i) {
      // LatLng latlngcar1 = LatLng(a, b);
      //print("shafiq bhai ka londi ${a} ${b}");
      markercar2 = Marker(
        markerId: MarkerId(res.id),
        infoWindow: InfoWindow(
            title: "Guddi", snippet: "Malboro, Captain Black, Dunhil"),
        position: LatLng(res.lat, res.lng),
        // rotation: newLocalData.heading,
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5, 0.5),
      );

      markerlist.add(markercar2);
      markerlist.add(marker);
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

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/person.png");
    return byteData.buffer.asUint8List();
  }

  Future<Uint8List> getMarkercar() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/car_icon.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(
      LocationData newLocalData, Uint8List imageData, Uint8List imageDatacar) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    setState(() {
      lat = latlng.latitude;
      lng = latlng.longitude;
    });

    // print("guddi ${lat} $lng");
    //var usrMap = {"": "Tom", 'Email': 'tom@xyz.com'};

    this.setState(() async {
      //  [].forEach((k,v) => print(''));

      // usrMap.forEach((res, i)=>{
      //    Marker(
      //     markerId: MarkerId(i),
      //     position: res.[1],
      //     rotation: newLocalData.heading,
      //     draggable: false,
      //     zIndex: 2,
      //     flat: true,
      //     anchor: Offset(0.5, 0.5),
      //     icon: BitmapDescriptor.fromBytes(imageData));
      // });

      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));

      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));

      // getDriveers();
      Need driver = new Need();
      print("guddi driver ${listofdrivers}");

      ///////////////////////////////////////
      //
      // final ref = fb.reference();
      //
      // ref
      //     .child("users")
      //     .child("user1")
      //     .child('lat')
      //     .once()
      //     .then((DataSnapshot data) {
      //   setState(() {
      //     a = data.value;
      //     print('Fetch guddi lat ${data.value}');
      //   });
      // });
      //
      // ref
      //     .child("users")
      //     .child("user1")
      //     .child("lng")
      //     .once()
      //     .then((DataSnapshot data) {
      //   setState(() {
      //     b = data.value;
      //     print("Fetch guddi  lng ${data.value}");
      //   });
      // });
      //
      // LatLng latlngcar = LatLng(a, b);
      // markercar = Marker(
      //     markerId: MarkerId("homecar"),
      //     infoWindow: InfoWindow(
      //         title: "Guddi", snippet: "Malboro, Captain Black, Dunhil"),
      //     position: latlngcar,
      //     rotation: newLocalData.heading,
      //     draggable: false,
      //     zIndex: 2,
      //     flat: true,
      //     anchor: Offset(0.5, 0.5),
      //     icon: BitmapDescriptor.fromBytes(imageDatacar));
      //
      // circlecar = Circle(
      //     circleId: CircleId("carcar"),
      //     //radius: newLocalData.accuracy,
      //     zIndex: 1,
      //     strokeColor: Colors.blue,
      //     center: latlngcar,
      //     fillColor: Colors.blue.withAlpha(70));
      //
      // ////////////////Captain 2
      //
      // ref
      //     .child("users")
      //     .child("drivers")
      //     .child('lat')
      //     .once()
      //     .then((DataSnapshot data) {
      //   setState(() {
      //     c = data.value;
      //     print('Fetch guddi lat ${data.value}');
      //   });
      // });
      //
      // // ref.child("users").foreach((res,i)=>{
      // //
      // // });
      //
      // ref
      //     .child("users")
      //     .child("drivers")
      //     .child("user3")
      //     .child("lng")
      //     .once()
      //     .then((DataSnapshot data) {
      //   setState(() {
      //     d = data.value;
      //     print("Fetch guddi  lng ${data.value}");
      //   });
      // });

      ////////
      //final viewModel = watch(getDataFuture);
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
            icon: BitmapDescriptor.fromBytes(imageDatacar)));
        markerlist.add(marker);
        // Await the http get response, then decode the json-formatted response.
        // var response = await http.get(Uri.parse(url));
        // needFromJson(response.body);
        // if (response.statusCode == 200) {
        //   var jsonResponse = jsonDecode(response.body);
        //   var itemCount = jsonResponse['si3GymwFAMfsNkJXw3PwsBD4MMI3'];
        //
        //   for (int i = 0; i < jsonResponse.length; i++) {
        //     double itemlat = jsonResponse['lat'];
        //     double itemlng = jsonResponse['lng'];
        //     print("guddi latitude longitude $itemlng $itemlng ");
        //
        //     // listofdrivers.add(Need.fromJson(jsonResponse[i]));
        //     LatLng latlngcar1 = LatLng(itemlat, itemlng);
        //
        //     mar_kar.addAll(Marker(
        //         markerId: MarkerId("homecar $i"),
        //         infoWindow: InfoWindow(
        //             title: "Guddi", snippet: "Malboro, Captain Black, Dunhil"),
        //         position: latlngcar1,
        //         rotation: newLocalData.heading,
        //         draggable: false,
        //         zIndex: 2,
        //         flat: true,
        //         anchor: Offset(0.5, 0.5),
        //         icon: BitmapDescriptor.fromBytes(imageDatacar)) as List<Marker>);
        //
        //     markercar1 = Marker(
        //         markerId: MarkerId("homecar "),
        //         infoWindow: InfoWindow(
        //             title: "Guddi", snippet: "Malboro, Captain Black, Dunhil"),
        //         position: latlngcar1,
        //         rotation: newLocalData.heading,
        //         draggable: false,
        //         zIndex: 2,
        //         flat: true,
        //         anchor: Offset(0.5, 0.5),
        //         icon: BitmapDescriptor.fromBytes(imageDatacar));
        //
        //     circlecar1 = Circle(
        //         circleId: CircleId("carcar1$i"),
        //         //radius: newLocalData.accuracy,
        //         zIndex: 1,
        //         strokeColor: Colors.blue,
        //         center: latlngcar1,
        //         fillColor: Colors.blue.withAlpha(70));
        //   }
        //   //print(' http: guddi data $itemCount.');
        //   //print(' http: guddi response $jsonResponse.');
        // } else {
        //   print('Request failed with status: ${response.statusCode}.');
        // }

        ///////////////////////////////////////
      });
    });
  }

  // fetchall() {
  //   getDriveers();
  // }
  //
  // getDriveers() async {
  //   print("shafiq bhai ka londa ${Getdatafromapi().getdrivers()}");
  //   Uint8List imageDatacar = await getMarkercar();
  //
  //   //var driversLatLng = await Getdatafromapi().getdrivers();
  //
  //   setState(() async {
  //     var driversLatLng = await Getdatafromapi().getdrivers();
  //     Need dd = new Need();
  //     a = dd.lat;
  //     b = dd.lng;
  //     print("shafiq bhai ka londi ${dd.lat} ${b}");
  //   });
  //   LatLng latlngcar1 = LatLng(a, b);
  //   //print("shafiq bhai ka londi ${a} ${b}");
  //   markercar1 = Marker(
  //       markerId: MarkerId("homecar "),
  //       infoWindow: InfoWindow(
  //           title: "Guddi", snippet: "Malboro, Captain Black, Dunhil"),
  //       position: latlngcar1,
  //       // rotation: newLocalData.heading,
  //       draggable: false,
  //       zIndex: 2,
  //       flat: true,
  //       anchor: Offset(0.5, 0.5),
  //       icon: BitmapDescriptor.fromBytes(imageDatacar));
  //
  //   circlecar1 = Circle(
  //       circleId: CircleId("carcar1"),
  //       //radius: newLocalData.accuracy,
  //       zIndex: 1,
  //       strokeColor: Colors.blue,
  //       center: latlngcar1,
  //       fillColor: Colors.blue.withAlpha(70));
  // }

  // bool ontap = false;
  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      Uint8List imageDatacar = await getMarkercar();
      var location = await _locationTracker.getLocation();

      print("pagal pagal ${location.latitude.toString()}");

      // updateMarkerAndCircle(location, imageData, imageDatacar);
      print("guddi corrdinates ${location.latitude} ${location.longitude}");
      final r = fb.reference().child("users");

      r
          .child("passengers")
          .child('user2')
          .set({"lat": location?.latitude, "lng": location?.longitude});
      updateMarkerAndCircle(location, imageData, imageDatacar);
      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      // Need driver = new Need();
      // print("Guddi Model ${driver.lng}");
      //  getdrivers();

      _locationSubscription =
          _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            //bearing: 192.8334901395799,
            target: LatLng(newLocalData.latitude, newLocalData.longitude),
            // tilt: 0,
            zoom: 17.0,
          )));

          marker = Marker(
              markerId: MarkerId("munib"),
              position: LatLng(newLocalData.latitude, newLocalData.longitude),
              infoWindow: InfoWindow(
                  title: "John", snippet: "Malboro, Captain Black, Dunhil")
              //onTap: showAlertDialog(context),
              );

          updateMarkerAndCircle(newLocalData, imageData, imageDatacar);
        }
      });

      if (_controllercar != null) {
        // _controllercar
        //     .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        //   bearing: 192.8334901395799,
        //   target: LatLng(a, b),
        //   tilt: 0,
        //   zoom: 17.0,
        // )));

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
              icon: BitmapDescriptor.fromBytes(imageDatacar)));
          markerlist.add(marker);
          // Await the http get response, then decode the json-formatted response.
          // var response = await http.get(Uri.parse(url));
          // needFromJson(response.body);
          // if (response.statusCode == 200) {
          //   var jsonResponse = jsonDecode(response.body);
          //   var itemCount = jsonResponse['si3GymwFAMfsNkJXw3PwsBD4MMI3'];
          //
          //   for (int i = 0; i < jsonResponse.length; i++) {
          //     double itemlat = jsonResponse['lat'];
          //     double itemlng = jsonResponse['lng'];
          //     print("guddi latitude longitude $itemlng $itemlng ");
          //
          //     // listofdrivers.add(Need.fromJson(jsonResponse[i]));
          //     LatLng latlngcar1 = LatLng(itemlat, itemlng);
          //
          //     mar_kar.addAll(Marker(
          //         markerId: MarkerId("homecar $i"),
          //         infoWindow: InfoWindow(
          //             title: "Guddi", snippet: "Malboro, Captain Black, Dunhil"),
          //         position: latlngcar1,
          //         rotation: newLocalData.heading,
          //         draggable: false,
          //         zIndex: 2,
          //         flat: true,
          //         anchor: Offset(0.5, 0.5),
          //         icon: BitmapDescriptor.fromBytes(imageDatacar)) as List<Marker>);
          //
          //     markercar1 = Marker(
          //         markerId: MarkerId("homecar "),
          //         infoWindow: InfoWindow(
          //             title: "Guddi", snippet: "Malboro, Captain Black, Dunhil"),
          //         position: latlngcar1,
          //         rotation: newLocalData.heading,
          //         draggable: false,
          //         zIndex: 2,
          //         flat: true,
          //         anchor: Offset(0.5, 0.5),
          //         icon: BitmapDescriptor.fromBytes(imageDatacar));
          //
          //     circlecar1 = Circle(
          //         circleId: CircleId("carcar1$i"),
          //         //radius: newLocalData.accuracy,
          //         zIndex: 1,
          //         strokeColor: Colors.blue,
          //         center: latlngcar1,
          //         fillColor: Colors.blue.withAlpha(70));
          //   }
          //   //print(' http: guddi data $itemCount.');
          //   //print(' http: guddi response $jsonResponse.');
          // } else {
          //   print('Request failed with status: ${response.statusCode}.');
          // }

          ///////////////////////////////////////
        });

        updateMarkerAndCircle(null, imageData, imageDatacar);
      }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  Set<Marker> _marker = HashSet<Marker>();
  Widget build(BuildContext context) {
    final ref = fb.reference();
    final r = fb.reference().child("users");
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: Text(
      //     "Map",
      //     style: GoogleFonts.lato(),
      //   ),
      // ),

      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              mapType: chagetheme == false ? MapType.normal : MapType.hybrid,
              initialCameraPosition: initialLocation,
              markers: Set.of((markerlist != null) ? markerlist : []),

              //markers: Set.of((marker != null) ? [marker, markercar] : []),
              //zoomGesturesEnabled: false,
              //scrollGesturesEnabled: false,
              //tiltGesturesEnabled: false,
              // rotateGesturesEnabled: false,

              //markers: Set.of(markerslist),
              //markers: markerslist.map((e) => e).toSet(),

              circles: Set.of((circle != null) ? [circle] : []),

              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
                setState(() {
                  _marker.add(markercar);
                });
              },
            ),

            // Positioned(
            //   top: 320,
            //   left: 150,
            //   child: ok != true ? mangwaloButton(context) : Container(),
            // ),

            Positioned(
                right: 10,
                bottom: 120,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (chagetheme == false) {
                            chagetheme = true;
                          } else {
                            chagetheme = false;
                          }
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                              ]),
                          height: size.height * 0.05,
                          width: size.width * 0.09,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/earth.png'),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        getCurrentLocation();
                        print("munib $marker");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                offset: Offset(4, 8), // Shadow position
                              ),
                            ]),
                        height: size.height * 0.05,
                        width: size.width * 0.09,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/currnet.png'),
                        ),
                      ),
                    ),
                  ],
                )),

            Positioned(
              top: 0,
              right: 2,
              left: 2,
              child:
                  //ok != true ? Container() :
                  AppbarLocationAndPKR(size: size),
            ),

            Positioned(
              bottom: 10,
              right: 70,
              child:
                  //ok != true ? Container() :
                  bottomBtnWithFares(size),
            ),
          ],
        ),
      ),
    );
  }

  Container bottomBtnWithFares(Size size) {
    return Container(
      height: size.height * 0.15,
      width: size.width * 0.73,
      //color: Colors.red,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xff222323),
              borderRadius: BorderRadius.circular(20.0),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey,
              //     blurRadius: 10,
              //     offset: Offset(4, 8), // Shadow position
              //   ),
              // ]
            ),
            height: size.height * 0.08,
            width: size.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.stacked_line_chart_sharp,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "It's busy. Fares are \n higher than usual ",
                  style: GoogleFonts.lato(fontSize: 19, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.info_outline_rounded,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                getCurrentLocation();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff23a300),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(4, 8), // Shadow position
                      ),
                    ]),
                height: size.height * 0.05,
                width: size.width * 0.7,
                child: Center(
                  child: Text(
                    "Conform Pickup",
                    style: GoogleFonts.lato(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  GestureDetector mangwaloButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAlertDialog(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xCEE58100),
          borderRadius: BorderRadius.circular(40.0),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     blurRadius: 10,
          //     offset: Offset(4, 8), // Shadow position
          //   ),
          // ]
        ),
        height: MediaQuery.of(context).size.height * 0.190,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset("assets/1.png"),
              Text(
                "Tap for Mangwalo",
                style: GoogleFonts.dekko(
                    fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => GoogleMapScreen()));
        setState(() {
          ok = true;
          Navigator.pop(context);
        });
      },
    );

    Widget cencel = FlatButton(
      child: Text("Cencel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Row(
        children: [
          Text(
            "Dunhill, ",
            style: GoogleFonts.patuaOne(),
          ),
          Text(
            "Marlboro, ",
            style: GoogleFonts.patuaOne(),
          ),
          Text(
            "Captain Black",
            style: GoogleFonts.patuaOne(),
          ),
        ],
      ),
      // content: TextFormField(),
      actions: [okButton, cencel],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
