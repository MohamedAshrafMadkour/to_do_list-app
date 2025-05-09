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
    apiKey: 'AIzaSyDnv-89UJR63iBPS9K_pnI5BF2RDF6UXlY',
    appId: '1:256126629900:web:2b219f312874a7799b1629',
    messagingSenderId: '256126629900',
    projectId: 'to-do-list-6b9dc',
    authDomain: 'to-do-list-6b9dc.firebaseapp.com',
    storageBucket: 'to-do-list-6b9dc.firebasestorage.app',
    measurementId: 'G-KMJF52M8TP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBoTDVLJ9ZTTmkXoj4eAgYluxv0THRy-RU',
    appId: '1:256126629900:android:20eedeb2604c8bf59b1629',
    messagingSenderId: '256126629900',
    projectId: 'to-do-list-6b9dc',
    storageBucket: 'to-do-list-6b9dc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGops7EEelwm5PIfjms-KG5CMsQZbZISA',
    appId: '1:256126629900:ios:48f9bdd8b50b6a269b1629',
    messagingSenderId: '256126629900',
    projectId: 'to-do-list-6b9dc',
    storageBucket: 'to-do-list-6b9dc.firebasestorage.app',
    iosBundleId: 'com.example.toDoListApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGops7EEelwm5PIfjms-KG5CMsQZbZISA',
    appId: '1:256126629900:ios:48f9bdd8b50b6a269b1629',
    messagingSenderId: '256126629900',
    projectId: 'to-do-list-6b9dc',
    storageBucket: 'to-do-list-6b9dc.firebasestorage.app',
    iosBundleId: 'com.example.toDoListApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDnv-89UJR63iBPS9K_pnI5BF2RDF6UXlY',
    appId: '1:256126629900:web:807f4ac398f80ffb9b1629',
    messagingSenderId: '256126629900',
    projectId: 'to-do-list-6b9dc',
    authDomain: 'to-do-list-6b9dc.firebaseapp.com',
    storageBucket: 'to-do-list-6b9dc.firebasestorage.app',
    measurementId: 'G-LYB21HX60S',
  );
}
