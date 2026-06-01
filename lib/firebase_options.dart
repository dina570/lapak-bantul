import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform, kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError('Platform ini belum dikonfigurasi di firebase_options.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyFakeKey_Web_1234567890',
    appId: '1:1234567890:web:abcdef123456',
    messagingSenderId: '1234567890',
    projectId: 'lapakbantul-prd',
    authDomain: 'lapakbantul-prd.firebaseapp.com',
    storageBucket: 'lapakbantul-prd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyFakeKey_Android_987654321',
    appId: '1:1234567890:android:abcdef123456',
    messagingSenderId: '1234567890',
    projectId: 'lapakbantul-prd',
    storageBucket: 'lapakbantul-prd.appspot.com',
  );
}