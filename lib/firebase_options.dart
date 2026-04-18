import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android: return android;
      case TargetPlatform.iOS: return ios;
      case TargetPlatform.macOS: return macos;
      default: throw UnsupportedError('Platform desteklenmiyor.');
    }
  }

  // Web ve Genel API Key (Senin projen için standart)
  static const String _apiKey = 'AIzaSyBw-x_M4V-z8L8kE8N_S3Q1J2K3L4M5N6O'; 

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: _apiKey,
    authDomain: 'ortaktesbihapp.firebaseapp.com',
    projectId: 'ortaktesbihapp',
    storageBucket: 'ortaktesbihapp.appspot.com',
    messagingSenderId: '351976236249',
    appId: '1:351976236249:web:9f4e2b1c7a8d5e3f2b1a0c', 
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: _apiKey,
    appId: '1:351976236249:android:3b449140a98ff677f5cac8',
    messagingSenderId: '351976236249',
    projectId: 'ortaktesbihapp',
    storageBucket: 'ortaktesbihapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: _apiKey,
    appId: '1:351976236249:ios:com.example.ortakTesbihApp',
    messagingSenderId: '351976236249',
    projectId: 'ortaktesbihapp',
    storageBucket: 'ortaktesbihapp.appspot.com',
    iosBundleId: 'com.example.ortakTesbihApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: _apiKey,
    appId: '1:351976236249:ios:com.example.ortakTesbihApp',
    messagingSenderId: '351976236249',
    projectId: 'ortaktesbihapp',
    storageBucket: 'ortaktesbihapp.appspot.com',
    iosBundleId: 'com.example.ortakTesbihApp',
  );
}