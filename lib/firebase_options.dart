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
    apiKey: 'AIzaSyBxoA3FmAqbxXOwxxO3UlkE2iru5YIi1s0',
    appId: '1:1055777289712:web:b9cdaad83e4649938ad935',
    messagingSenderId: '1055777289712',
    projectId: 'tourmate-app-b2264',
    authDomain: 'tourmate-app-b2264.firebaseapp.com',
    storageBucket: 'tourmate-app-b2264.appspot.com',
    measurementId: 'G-DCZ5S357E1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTYcIMC3rQV8-1tZ-7hNjG4pj8drdy5Uo',
    appId: '1:1055777289712:android:3e0a35d5845f68fc8ad935',
    messagingSenderId: '1055777289712',
    projectId: 'tourmate-app-b2264',
    storageBucket: 'tourmate-app-b2264.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_TIeQPfv9ttkX4mIyNbOlwGduMvJGPxQ',
    appId: '1:1055777289712:ios:c1d0a4621030b8188ad935',
    messagingSenderId: '1055777289712',
    projectId: 'tourmate-app-b2264',
    storageBucket: 'tourmate-app-b2264.appspot.com',
    androidClientId: '1055777289712-184gt1g1n6a26e735vnjmt1ik1b8mpqv.apps.googleusercontent.com',
    iosClientId: '1055777289712-fmbi1uginomq3vkfdqfiaufrd6p1j74r.apps.googleusercontent.com',
    iosBundleId: 'com.example.tourGuideApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_TIeQPfv9ttkX4mIyNbOlwGduMvJGPxQ',
    appId: '1:1055777289712:ios:c1d0a4621030b8188ad935',
    messagingSenderId: '1055777289712',
    projectId: 'tourmate-app-b2264',
    storageBucket: 'tourmate-app-b2264.appspot.com',
    androidClientId: '1055777289712-184gt1g1n6a26e735vnjmt1ik1b8mpqv.apps.googleusercontent.com',
    iosClientId: '1055777289712-fmbi1uginomq3vkfdqfiaufrd6p1j74r.apps.googleusercontent.com',
    iosBundleId: 'com.example.tourGuideApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBxoA3FmAqbxXOwxxO3UlkE2iru5YIi1s0',
    appId: '1:1055777289712:web:d91dcc522219c27d8ad935',
    messagingSenderId: '1055777289712',
    projectId: 'tourmate-app-b2264',
    authDomain: 'tourmate-app-b2264.firebaseapp.com',
    storageBucket: 'tourmate-app-b2264.appspot.com',
    measurementId: 'G-XH82BVB5WB',
  );

}