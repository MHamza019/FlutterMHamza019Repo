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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyASA9PtPPLZPY6DLK1zLopUv_4J0c8CC6A',
    appId: '1:868071963296:web:0324ac5c7337358ce627c5',
    messagingSenderId: '868071963296',
    projectId: 'first-firebase-study-f7c53',
    authDomain: 'first-firebase-study-f7c53.firebaseapp.com',
    storageBucket: 'first-firebase-study-f7c53.appspot.com',
    measurementId: 'G-SNDEMMQDRT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCLnHYquLUhXw2-_8CZIyI2IAS7GOhxPVo',
    appId: '1:868071963296:android:ed13ee749ca582d1e627c5',
    messagingSenderId: '868071963296',
    projectId: 'first-firebase-study-f7c53',
    storageBucket: 'first-firebase-study-f7c53.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTV-XwD4sP-VSh66plasjEDb70SLcgR50',
    appId: '1:868071963296:ios:da7615e1614a6fe0e627c5',
    messagingSenderId: '868071963296',
    projectId: 'first-firebase-study-f7c53',
    storageBucket: 'first-firebase-study-f7c53.appspot.com',
    iosClientId: '868071963296-3fnrbs552te8gknh2gt02n84a2ft9ggb.apps.googleusercontent.com',
    iosBundleId: 'com.example.noticeBoardApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTV-XwD4sP-VSh66plasjEDb70SLcgR50',
    appId: '1:868071963296:ios:da7615e1614a6fe0e627c5',
    messagingSenderId: '868071963296',
    projectId: 'first-firebase-study-f7c53',
    storageBucket: 'first-firebase-study-f7c53.appspot.com',
    iosClientId: '868071963296-3fnrbs552te8gknh2gt02n84a2ft9ggb.apps.googleusercontent.com',
    iosBundleId: 'com.example.noticeBoardApp',
  );
}
