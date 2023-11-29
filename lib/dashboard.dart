import 'package:flutter/material.dart';
import 'login.dart'; // Pastikan Anda mengganti 'login.dart' dengan nama file yang benar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
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
      body: Center(
        child: DataTable(
          columns: [
            DataColumn(label: Text('Nama')),
            DataColumn(label: Text('Hari')),
            DataColumn(label: Text('Jam Masuk')),
            DataColumn(label: Text('Jam Keluar')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('John Doe')),
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
    );
  }
}
