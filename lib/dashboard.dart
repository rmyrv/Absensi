// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'My App',
//       home: Dashboard(),
//     );
//   }
// }

// class Dashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFAB8C5F),
//         leading: PopupMenuButton<String>(
//           itemBuilder: (BuildContext context) {
//             return [
//               PopupMenuItem<String>(
//                 value: 'logout',
//                 child: ListTile(
//                   leading: Icon(Icons.exit_to_app),
//                   title: Text('Logout'),
//                 ),
//               ),
//             ];
//           },
//           onSelected: (value) {
//             if (value == 'logout') {
//               // Tambahkan logika logout di sini
//               // Misalnya, panggil fungsi untuk menghapus token, membersihkan sesi, dll.
//               // Setelah logout, arahkan pengguna ke layar login atau halaman lainnya.
//             }
//           },
//         ),
//         title: Center(
//           child: Image.asset(
//             'assets/absensi.png',
//             height: 100,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             buildStyledTableRow('Nama', ['User', 'id']),
//             buildStyledTableRow('UID', ['Unique ID', 'id']),
//             buildStyledTableRow('Waktu', ['Date', 'Time']),
//             // Tambahkan dua tabel lainnya dengan cara yang serupa
//           ],
//         ),
//       ),
//     );
//   }

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
//         return Table(
//           border: TableBorder.all(),
//           defaultVerticalAlignment:
//               TableCellVerticalAlignment.middle, // Tambahkan ini
//           children: [
//             TableRow(
//               children: columns
//                   .map(
//                     (column) => TableCell(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(column),
//                       ),
//                     ),
//                   )
//                   .toList(),
//             ),
//             ...data!
//                 .map(
//                   (doc) => TableRow(
//                     children: columns
//                         .map(
//                           (col) => TableCell(
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(doc[col] ?? ''),
//                             ),
//                           ),
//                         )
//                         .toList(),
//                   ),
//                 )
//                 .toList(),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

class DatabaseReadExample extends StatefulWidget {
  @override
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

void main() {
  runApp(MaterialApp(
    home: DatabaseReadExample(),
  ));
}
