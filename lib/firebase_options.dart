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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZ1cNgWY5SMYsi1P2HFmkPfz9ft8NZ1qQ',
    appId: '1:96032123411:android:224696ebe5c1f56f996de6',
    messagingSenderId: '96032123411',
    projectId: 'ai-project-e97e9',
    databaseURL: 'https://ai-project-e97e9-default-rtdb.firebaseio.com',
    storageBucket: 'ai-project-e97e9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZ1cNgWY5SMYsi1P2HFmkPfz9ft8NZ1qQ',
    appId: '1:96032123411:ios:020d1f79b3108e0c996de6',
    messagingSenderId: '96032123411',
    projectId: 'ai-project-e97e9',
    databaseURL: 'https://ai-project-e97e9-default-rtdb.firebaseio.com',
    storageBucket: 'ai-project-e97e9.appspot.com',
    androidClientId: '96032123411-87ukg4g7v0a6b9292to6tkqnh2np54ap.apps.googleusercontent.com',
    iosClientId: '96032123411-g6s34gshs5eujepvdv8jn28lqep25m63.apps.googleusercontent.com',
    iosBundleId: 'com.hassan.myAi',
  );
}
