// import 'package:projectabsensi/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Absensi",
//             style: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         drawer: Drawer(
//           child: ListView(
//             children: [
//               UserAccountsDrawerHeader(
//                 accountName: Text("Nama Pengguna"),
//                 accountEmail: Text("email@example.com"),
//                 currentAccountPicture: CircleAvatar(
//                   backgroundImage: AssetImage("path_to_your_profile_image.jpg"),
//                 ),
//               ),
//               ListTile(
//                 title: Text("Logout"),
//                 onTap: () {
//                   // Aksi yang akan diambil saat tombol "Logout" ditekan
//                   Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(builder: (context) => LoginPage()),
//                     (Route<dynamic> route) => false,
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//         body: FutureBuilder(
//             future: fetchData(),
//             builder: (context, snapshot) {
//               return ListView(
//                 children: [
//                   Center(
//                     child: DataTable(
//                       columns: [
//                         DataColumn(label: Text('Nama')),
//                         DataColumn(label: Text('Hari')),
//                         DataColumn(label: Text('Jam Masuk')),
//                         DataColumn(label: Text('Jam Keluar')),
//                       ],
//                       rows: [
//                         DataRow(cells: [
//                           DataCell(Text('$_namaValue')),
//                           DataCell(Text('Senin')),
//                           DataCell(Text('08:00')),
//                           DataCell(Text('17:00')),
//                         ]),
//                         DataRow(cells: [
//                           DataCell(Text('Jane Smith')),
//                           DataCell(Text('Selasa')),
//                           DataCell(Text('09:00')),
//                           DataCell(Text('18:00')),
//                         ]),
//                         // Tambahkan baris lain sesuai kebutuhan
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             }));
//   }
// }

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Absensi'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var data = snapshot.data?.docs;

          return DataTable(
            columns: [
              DataColumn(label: Text('dhgsadhgasdna')),
              DataColumn(label: Text('fssdsfdafdsd')),
              // tambahkan DataColumn lain sesuai kebutuhan
            ],
            rows: data!
                .map(
                  (doc) => DataRow(
                    cells: [
                      DataCell(Text(doc['UID'])),
                      DataCell(Text(doc['dates'])),
                      // tambahkan DataCell lain sesuai kebutuhan
                    ],
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
