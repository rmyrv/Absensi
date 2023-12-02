import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeApp();
}

void initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null);

  try {
    print('Before initializing Firebase');
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAuPr62WJDEHIRIsA7QE_fXHrUKLRoXkOU",
        appId: "1:692446825080:android:ebdf7f9c29a2b36ddcbb8d",
        messagingSenderId: "692446825080",
        projectId: "rfidwemosdb", // Remove trailing space
        storageBucket: "rfidwemosdb.appspot.com",
        databaseURL: "https://rfidwemosdb-default-rtdb.firebaseio.com/",
      ),
    );
    print('Firebase initialized successfully');
    runApp(const DatabaseReadExample());
  } catch (e) {
    print(e.toString());
    runApp(DatabaseReadExample(errorMessage: e.toString()));
  }
}

class DatabaseReadExample extends StatefulWidget {
  @override
  const DatabaseReadExample({Key? key, this.errorMessage}) : super(key: key);

  final String? errorMessage;
  _DatabaseReadExampleState createState() => _DatabaseReadExampleState();
}

class _DatabaseReadExampleState extends State<DatabaseReadExample> {
  final DatabaseReference _namaRef = FirebaseDatabase.instance
      .reference()
      .child('users')
      .child('UID')
      .child('Nama');
  final DatabaseReference _prodiRef = FirebaseDatabase.instance
      .reference()
      .child('users')
      .child('UID')
      .child('Prodi');
  final DatabaseReference _waktuRef = FirebaseDatabase.instance
      .reference()
      .child('users')
      .child('UID')
      .child('Waktu');

  String _nama = 'Loading...';
  String _prodi = 'Loading...';
  String _waktu = 'Loading...';

  @override
  void initState() {
    super.initState();

    // Mendengarkan perubahan data di database untuk Nama
    _namaRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          _nama = event.snapshot.value.toString();
        });
      }
    });

    // Mendengarkan perubahan data di database untuk Prodi
    _prodiRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          _prodi = event.snapshot.value.toString();
        });
      }
    });

    // Mendengarkan perubahan data di database untuk Waktu
    _waktuRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          _waktu = event.snapshot.value.toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Read Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nama: $_nama'),
            Text('Prodi: $_prodi'),
            Text('Waktu: $_waktu'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Membaca data kembali (contoh penggunaan)
                _namaRef.once().then((DataSnapshot snapshot) {
                      if (snapshot.value != null) {
                        setState(() {
                          _nama = snapshot.value.toString();
                        });
                      }
                    } as FutureOr Function(DatabaseEvent value));

                _prodiRef.once().then((DataSnapshot snapshot) {
                      if (snapshot.value != null) {
                        setState(() {
                          _prodi = snapshot.value.toString();
                        });
                      }
                    } as FutureOr Function(DatabaseEvent value));

                _waktuRef.once().then((DataSnapshot snapshot) {
                      if (snapshot.value != null) {
                        setState(() {
                          _waktu = snapshot.value.toString();
                        });
                      }
                    } as FutureOr Function(DatabaseEvent value));
              },
              child: Text('Baca Ulang Data'),
            ),
          ],
        ),
      ),
    );
  }
}
