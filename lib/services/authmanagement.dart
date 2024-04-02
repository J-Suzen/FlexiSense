import 'package:flexi_sense_companion/screens/page_2.dart';
import 'package:flexi_sense_companion/screens/page_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
class AuthManagement {
  signIn(context) {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: '@gmail.com', password: '123').then((signedIn) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => new NewScreen()
      ));
    }


    );
  }

}
