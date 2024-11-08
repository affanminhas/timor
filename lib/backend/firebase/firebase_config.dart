import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCm5wcAeToNCOmlEKRHec0bSTkXS0BL5iQ",
            authDomain: "maknooz-jjnjgx.firebaseapp.com",
            projectId: "maknooz-jjnjgx",
            storageBucket: "maknooz-jjnjgx.appspot.com",
            messagingSenderId: "258470137681",
            appId: "1:258470137681:web:eca74e8685bc3e130c8d70"));
  } else {
    await Firebase.initializeApp();
  }
}
