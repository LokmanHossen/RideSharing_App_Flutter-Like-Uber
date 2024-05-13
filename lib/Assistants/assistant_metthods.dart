import 'package:firebase_database/firebase_database.dart';
import 'package:texi_ride_sharing_app_flutter/global/global.dart';
import 'package:texi_ride_sharing_app_flutter/models/user_models.dart';

class AssistantMethods {
  static void readCurrentOnlineUserInfo() async {
    currentUser = firebaseAuth.currentUser;
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child("users").child(currentUser!.uid);

    userRef.once().then(
      (snap) {
        if (snap.snapshot.value != null) {
          userModelCurrentInfo = USerModel.fromSnapshot(snap.snapshot);
        }
      },
    );
  }
}
