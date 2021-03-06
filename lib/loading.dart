//loading screen when data is being retrieved from database


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ionathon/colorScheme.dart';
import 'package:ionathon/homePage.dart';

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //retrievingData(context);
    return Scaffold(
      body: Container(
        color: lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitWave(
              color: darkBlue,
              size: 50.0,
            ),
            const SizedBox(height: 10,),
            Text('Loading', style: TextStyle(color: darkBlue),)
          ],
        ),
      ),
    );
  }

  retrievingData(BuildContext context){
    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("userInfo").doc(firebaseUser!.uid).get().then((value){

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()));


    });
  }
}
