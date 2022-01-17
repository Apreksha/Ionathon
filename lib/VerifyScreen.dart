//verify Screen after signup



import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ionathon/homePage.dart';


class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth =FirebaseAuth.instance;
  late User user;
  late Timer timer;


  @override
  void initState(){
    user = auth.currentUser!;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }


  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade300,
      body: Padding(
        padding: EdgeInsets.symmetric(),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              alignment: Alignment.bottomCenter,
              child: Icon(
                Icons.verified,
                size: 300,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 50,),
            Container(
              alignment: Alignment.center,
              child: Text('A verification email has been sent to ${user.email} verify it.',
                style: TextStyle(color: Colors.white,fontSize: 20.0),textAlign: TextAlign.center,),
            ),
            SizedBox(height:height/5,),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text('Verifying',style: TextStyle(fontSize: 15,
                color: Colors.white
              ),),
            ),
            Container(
         alignment: Alignment.bottomCenter,
         child: SpinKitWave(size: 30.0,color: Colors.black),
       )
          ],
        ),
      )
    );
  }
//checking Email verification
  Future <void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    var firebaseUser = FirebaseAuth.instance.currentUser;
    final firestoreInstance = FirebaseFirestore.instance;
    bool isVerified = true;
    if(user.emailVerified){
      firestoreInstance.collection("userInfo")
          .doc(firebaseUser!.uid)
          .update({'isVerified': isVerified }).then((_) => print("Success"));
      timer.cancel();
      print('email is verified');
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
    print('this is user: ${user.sendEmailVerification()}');

  }
}
