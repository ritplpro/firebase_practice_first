// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCQdLuuQN3HXubkiE2uFLRo1PWLuqjIQcw',
    appId: '1:6683490871:web:30753222ba5fc1e08a9db2',
    messagingSenderId: '6683490871',
    projectId: 'first-firebase-may26',
    authDomain: 'first-firebase-may26.firebaseapp.com',
    storageBucket: 'first-firebase-may26.appspot.com',
    measurementId: 'G-HVKQG40SQ8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdBxcCGJjCQsJJePmklelwLW4afZOaEjs',
    appId: '1:6683490871:android:e14af67fae11c4ab8a9db2',
    messagingSenderId: '6683490871',
    projectId: 'first-firebase-may26',
    storageBucket: 'first-firebase-may26.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCW9ivwNpjN-tmqp1kaUOcwOLrYbj5WaGk',
    appId: '1:6683490871:ios:ac69049450e803f48a9db2',
    messagingSenderId: '6683490871',
    projectId: 'first-firebase-may26',
    storageBucket: 'first-firebase-may26.appspot.com',
    iosBundleId: 'com.example.firebasePracticeFirst',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCW9ivwNpjN-tmqp1kaUOcwOLrYbj5WaGk',
    appId: '1:6683490871:ios:ac69049450e803f48a9db2',
    messagingSenderId: '6683490871',
    projectId: 'first-firebase-may26',
    storageBucket: 'first-firebase-may26.appspot.com',
    iosBundleId: 'com.example.firebasePracticeFirst',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCQdLuuQN3HXubkiE2uFLRo1PWLuqjIQcw',
    appId: '1:6683490871:web:eb29c1a862988e268a9db2',
    messagingSenderId: '6683490871',
    projectId: 'first-firebase-may26',
    authDomain: 'first-firebase-may26.firebaseapp.com',
    storageBucket: 'first-firebase-may26.appspot.com',
    measurementId: 'G-HN359YBCET',
  );
}
