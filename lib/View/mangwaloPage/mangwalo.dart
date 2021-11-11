import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/main.dart';
import 'package:google_fonts/google_fonts.dart';

class Mangwalo extends StatelessWidget {
  Mangwalo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0xffee8300),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                child: Image.asset(
                  "assets/back.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 25,
              left: 25,
              child: BlurryContainer(
                borderRadius: BorderRadius.circular(20),
                bgColor: Colors.white,
                child: Container(
                  // margin: EdgeInsets.only(
                  //     left: 10, right: 10, bottom: 10, top: 10),
                  width: size.width * .8,
                  height: size.height * .2,
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: Offset(0, 15),
                    //     blurRadius: 10,
                    //     color: LightColors.Shadowcolorimage,
                    //   ),
                    // ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/logo.png'), fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            Center(
              //child: mangwaloButton(context),
              child: mangwaloButton(context),
            ),
            // Positioned(
            //   bottom: 20,
            //   left: 80,
            //   child: Center(
            //     //child: mangwaloButton(context),
            //     child: mangwaloButton1(context),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  GestureDetector mangwaloButton1(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showAlertDialog(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xE2E58100),
          borderRadius: BorderRadius.circular(40.0),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     blurRadius: 10,
          //     offset: Offset(4, 8), // Shadow position
          //   ),
          // ]
        ),
        height: MediaQuery.of(context).size.height * 0.060,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              "Tap for Mangwalo",
              style:
                  GoogleFonts.dekko(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
        ),
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
          color: Color(0xE2E58100),
          borderRadius: BorderRadius.circular(40.0),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     blurRadius: 10,
          //     offset: Offset(4, 8), // Shadow position
          //   ),
          // ]
        ),
        height: MediaQuery.of(context).size.height * 0.250,
        width: MediaQuery.of(context).size.width * 0.4,
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
        // setState(() {
        //   ok = true;
        //   Navigator.pop(context);
        // });
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
      title: BlurryContainer(
        borderRadius: BorderRadius.circular(20),
        bgColor: Colors.white,
        child: Column(
          children: [
            Text("Type any item"),
            TextField(),
          ],
        ),
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
