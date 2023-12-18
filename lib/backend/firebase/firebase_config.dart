import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCj-CuEKcjFmvYkSmQARg9YIUG8rF1APFA",
            authDomain: "mungkul-ecommerce.firebaseapp.com",
            projectId: "mungkul-ecommerce",
            storageBucket: "mungkul-ecommerce.appspot.com",
            messagingSenderId: "1039875051143",
            appId: "1:1039875051143:web:2c5b4378cb2ca19af8f222",
            measurementId: "G-82MS211PN3"));
  } else {
    await Firebase.initializeApp();
  }
}
