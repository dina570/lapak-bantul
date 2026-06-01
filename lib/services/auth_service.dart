import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Fungsi login manual bawaan Anda
  Future<bool> loginMock(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return email.isNotEmpty && password.isNotEmpty;
  }

  // ===== AMAN UNTUK ANDROID & CHROME WEB =====
  Future<User?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        // Alur khusus Google Sign-In untuk platform browser Chrome
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        // Menggunakan signInWithPopup agar langsung muncul pop-up akun Google
        final UserCredential userCredential = await _auth.signInWithPopup(googleProvider);
        return userCredential.user;
      } else {
        // Alur untuk perangkat HP Android/iOS
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        if (googleUser == null) return null;

        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential = await _auth.signInWithCredential(credential);
        return userCredential.user;
      }
    } catch (e) {
      // Menangkap error agar tidak memunculkan layar merah crash di browser
      print("Gagal Login Google: $e");
      return null;
    }
  }

  // Fungsi Keluar Sesi
  Future<void> signOut() async {
    await _auth.signOut();
    if (!kIsWeb) {
      await _googleSignIn.signOut();
    }
  }
}