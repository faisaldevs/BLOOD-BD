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
    apiKey: 'AIzaSyDffq74N1vmI1Pg2l3nVlYZBGos0en6rRE',
    appId: '1:1019849787907:web:4893580d990584f82c9c36',
    messagingSenderId: '1019849787907',
    projectId: 'blood-bd-97496',
    authDomain: 'blood-bd-97496.firebaseapp.com',
    storageBucket: 'blood-bd-97496.appspot.com',
    measurementId: 'G-8EBBSVVPLF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4waeTxy9HmOJbCyeW5I160t-5Y5iVY1I',
    appId: '1:1019849787907:android:0434a68ea03da7632c9c36',
    messagingSenderId: '1019849787907',
    projectId: 'blood-bd-97496',
    storageBucket: 'blood-bd-97496.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCGTWhrnUeul25J9joQ-uazKM6MssYE94',
    appId: '1:1019849787907:ios:9f66288e412120b92c9c36',
    messagingSenderId: '1019849787907',
    projectId: 'blood-bd-97496',
    storageBucket: 'blood-bd-97496.appspot.com',
    iosBundleId: 'com.example.bloodBd',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCGTWhrnUeul25J9joQ-uazKM6MssYE94',
    appId: '1:1019849787907:ios:9f66288e412120b92c9c36',
    messagingSenderId: '1019849787907',
    projectId: 'blood-bd-97496',
    storageBucket: 'blood-bd-97496.appspot.com',
    iosBundleId: 'com.example.bloodBd',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDffq74N1vmI1Pg2l3nVlYZBGos0en6rRE',
    appId: '1:1019849787907:web:155c19b18883a6f32c9c36',
    messagingSenderId: '1019849787907',
    projectId: 'blood-bd-97496',
    authDomain: 'blood-bd-97496.firebaseapp.com',
    storageBucket: 'blood-bd-97496.appspot.com',
    measurementId: 'G-F3F6V4P8KY',
  );
}
