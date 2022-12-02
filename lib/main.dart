import 'package:chat_firebase/domain/controller/controlchat.dart';
import 'package:chat_firebase/domain/controller/controluser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetPlatform.isWeb
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyC5LglNozUNF2uGMlFPMFes3CsccwYIflQ",
              authDomain: "mintic-42f73.firebaseapp.com",
              projectId: "mintic-42f73",
              storageBucket: "mintic-42f73.appspot.com",
              messagingSenderId: "23948098148",
              appId: "1:23948098148:web:e6f54efd8af319dd32fd71"))
      : await Firebase.initializeApp();
  Get.put(ControlChat());
  Get.put(ControlAuthFirebase());
  runApp(const App());
}
