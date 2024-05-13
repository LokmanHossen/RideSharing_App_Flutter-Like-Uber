import 'package:firebase_auth/firebase_auth.dart';
import 'package:texi_ride_sharing_app_flutter/models/user_models.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
User? currentUser;

USerModel? userModelCurrentInfo;
