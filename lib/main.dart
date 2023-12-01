import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'dashboard.dart';

void main() {
  initializeApp();
}

void initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null);

  try {
    print('Before initializing Firebase');
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAuPr62WJDEHIRIsA7QE_fXHrUKLRoXkOU",
        appId: "1:692446825080:android:ebdf7f9c29a2b36ddcbb8d",
        messagingSenderId: "692446825080",
        projectId: "rfidwemosdb", // Remove trailing space
        storageBucket: "rfidwemosdb.appspot.com",
        databaseURL: "https://rfidwemosdb-default-rtdb.firebaseio.com/",
      ),
    );
    print('Firebase initialized successfully');
    runApp(const MyApp());
  } catch (e) {
    print(e.toString());
    runApp(MyApp(errorMessage: e.toString()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.errorMessage}) : super(key: key);

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Firebase App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}



// class MyAppNotConnected extends StatelessWidget {
//   final String errorMessage;

//   const MyAppNotConnected({Key? key, required this.errorMessage})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     print('Firebase Initialization Error: $errorMessage');

//     return MaterialApp(
//       title: 'My App (Not Connected)',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Not Connected to Firebase'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text('Firebase is not available. Check your connection.'),
//               const SizedBox(height: 10),
//               Text('Error: $errorMessage'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('My App'),
//         ),
//         body: const Center(
//           child: Text('Connected to Firebase!'),
//         ),
//       ),
//     );
//   }
// }
