import 'package:flutter/material.dart';
import 'package:projectabsensi/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo gambar di atas
            Image.asset(
              'assets/absensi.png', // Ganti dengan path logo yang benar
              width: 100.0,
              height: 100.0,
            ),
            SizedBox(height: 20.0),

            // Text "Absensi" di bawah logo
            Text(
              'Absensi',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),

            // TextField untuk nama pengguna
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Nama Pengguna',
              ),
            ),
            SizedBox(height: 10.0),

            // TextField untuk kata sandi
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Kata Sandi',
              ),
            ),
            SizedBox(height: 20.0),

            // Tombol login
            ElevatedButton(
              onPressed: () {
                // Logika pengecekan nama pengguna dan kata sandi
                if (usernameController.text == 'romi' &&
                    passwordController.text == 'romi') {
                  // Jika sesuai, pindah ke halaman Dashboard
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DatabaseReadExample()),
                  );
                } else {
                  // Jika tidak sesuai, tampilkan pesan kesalahan atau ambil tindakan lainnya
                  // Misalnya, munculkan dialog kesalahan
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Login Gagal'),
                        content: Text('Nama pengguna atau kata sandi salah.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
