// import 'package:flutter/material.dart';

// class Dashboard extends StatefulWidget {
//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();

//   // Referensi ke database Firebase Realtime
//   final DatabaseReference _usersRef =
//       FirebaseDatabase.instance.reference().child('users');

//   Future<void> _addUser() async {
//     try {
//       await _usersRef.push().set({
//         'NAMA': _nameController.text,
//         'UMUR': _ageController.text,
//       });

//       // Berhasil menambahkan data
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('User added successfully!'),
//         ),
//       );
//     } catch (e) {
//       // Terjadi kesalahan
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error adding user: $e'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firebase Dashboard'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'NAMA'),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _ageController,
//               decoration: InputDecoration(labelText: 'UMUR'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _addUser,
//               child: Text('Add User'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
