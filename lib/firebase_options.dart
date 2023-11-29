// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDlxDAjaN8u7MaE3ep_q3eO6deFxEq6o0U',
    appId: '1:801051955996:web:40d59f83a9b88af8aee0d9',
    messagingSenderId: '801051955996',
    projectId: 'messenger-217d8',
    authDomain: 'messenger-217d8.firebaseapp.com',
    storageBucket: 'messenger-217d8.appspot.com',
    measurementId: 'G-GFG722Q7X3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMyBuvHxext_FPqmaiEchOPgWGuQwu06U',
    appId: '1:801051955996:android:e020407f6b716073aee0d9',
    messagingSenderId: '801051955996',
    projectId: 'messenger-217d8',
    storageBucket: 'messenger-217d8.appspot.com',
  );
}