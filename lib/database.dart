import "package:cloud_firestore/cloud_firestore.dart";

//firebase database connection
class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference myCollection = FirebaseFirestore.instance
      .collection('userInfo');

  Future updateUserData(String name, String email,String password, String phoneNo, String image,bool isVerified, List subjects,Map topics,String time,String post,List days,Map mentOrstud) async {
    return await myCollection.doc(uid).set({
      'name': name,
      'email': email,
      'password':password,
      'phoneNo': phoneNo,
      'image': image,
      'isVerified':isVerified,
      'subjects':subjects,
      'topics':topics,
      'time':time,
      'post':post,
      'days':days,
      'mentOrstud':mentOrstud
    });
  }
}
