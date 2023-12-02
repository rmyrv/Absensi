// import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'dashboard.dart'; // Impor halaman dashboard.dart atau sesuaikan dengan nama file halaman dashboard Anda


// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: ScanYourIdScreen(),
//   ));
// }

// class ScanYourIdScreen extends StatefulWidget {
//   @override
//   _ScanYourIdScreenState createState() => _ScanYourIdScreenState();
// }

// class _ScanYourIdScreenState extends State<ScanYourIdScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();

//     // Inisialisasi AnimationController dengan durasi 2 detik
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );

//     // Tambahkan Tween untuk mengatur nilai animasi dari 0.0 hingga 1.0
//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );

//     // Tambahkan Listener untuk mengatur ulang animasi setelah selesai
//     _animationController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _animationController.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         _animationController.forward();
//       }
//     });

//     // Mulai animasi
//     _animationController.forward();
//   }

//   void _onScanCompleted() {
//     // Navigasi ke halaman dashboard.dart setelah terscan
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => DashboardScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scan Your ID!'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Tambahkan widget untuk menampilkan animasi scan
//             ScaleTransition(
//               scale: _animation,
//               child: Container(
//                 width: 200.0,
//                 height: 200.0,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(
//                         'assets/scanid.png'), // Ganti dengan path gambar scan
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             // Tambahkan teks "Scan Your ID"
//             Text(
//               'Scan Your ID',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _onScanCompleted,
//         child: Icon(Icons.done),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
// }
