import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'login.dart'; // Pastikan Anda mengganti 'login.dart' dengan nama file yang benar

class dashboardscreen extends StatefulWidget {
  const dashboardscreen({super.key});

  @override
  State<dashboardscreen> createState() => _dashboardscreenState();
}

class _dashboardscreenState extends State<dashboardscreen> {
  final DatabaseReference _namareference =
      FirebaseDatabase().reference().child('name');

  String _namaValue = "";
  @override
  void iniState() {
    fetchData();
  }

  Future fetchData() async {
    try {
      DatabaseEvent eventnama = await _namareference.once();

      if (eventnama.snapshot.value != null) {
        setState(() {
          _namaValue = eventnama.snapshot.value.toString();
        });
        return eventnama.snapshot.value;
      }
    } catch (e) {
      print("error fetching data $e");
      return e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Absensi",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Nama Pengguna"),
                accountEmail: Text("email@example.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("path_to_your_profile_image.jpg"),
                ),
              ),
              ListTile(
                title: Text("Logout"),
                onTap: () {
                  // Aksi yang akan diambil saat tombol "Logout" ditekan
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
        body: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              return ListView(
                children: [
                  Center(
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Nama')),
                        DataColumn(label: Text('Hari')),
                        DataColumn(label: Text('Jam Masuk')),
                        DataColumn(label: Text('Jam Keluar')),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('$_namaValue')),
                          DataCell(Text('Senin')),
                          DataCell(Text('08:00')),
                          DataCell(Text('17:00')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Jane Smith')),
                          DataCell(Text('Selasa')),
                          DataCell(Text('09:00')),
                          DataCell(Text('18:00')),
                        ]),
                        // Tambahkan baris lain sesuai kebutuhan
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
