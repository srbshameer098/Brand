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
    apiKey: 'AIzaSyCbyXnfZwIfBRK70Alm5i0azR7xXIzyjrQ',
    appId: '1:905017871670:web:980b59f03d0dc2a12b3797',
    messagingSenderId: '905017871670',
    projectId: 'brand-410b7',
    authDomain: 'brand-410b7.firebaseapp.com',
    storageBucket: 'brand-410b7.appspot.com',
    measurementId: 'G-8LNDE5SQ5C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDa9OUpKfdqtijXzGfj4N6_iLd8dNhmFQo',
    appId: '1:905017871670:android:652550871d4be1052b3797',
    messagingSenderId: '905017871670',
    projectId: 'brand-410b7',
    storageBucket: 'brand-410b7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVGE2bLIBMSHfze3Hz7lN2HXhm1QGhOP0',
    appId: '1:905017871670:ios:4bceb736e34b4e822b3797',
    messagingSenderId: '905017871670',
    projectId: 'brand-410b7',
    storageBucket: 'brand-410b7.appspot.com',
    iosClientId: '905017871670-71bp7n0bugl61h5o6c66563lk5aqhqtm.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCVGE2bLIBMSHfze3Hz7lN2HXhm1QGhOP0',
    appId: '1:905017871670:ios:0b97a82b43a1d64d2b3797',
    messagingSenderId: '905017871670',
    projectId: 'brand-410b7',
    storageBucket: 'brand-410b7.appspot.com',
    iosClientId: '905017871670-ab6pt00ngi6tg2nte24t7hk2hfa80tpr.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled1.RunnerTests',
  );
}