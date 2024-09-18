import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                if (login(_usernameController.text, _passwordController.text)) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login gagal!')),
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

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Colors.blue, // consistent theme color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('1. Penjumlahan'),
                leading: Icon(Icons.add), // add an icon
                onTap: () {
                  penjumlahan(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('2. Pengurangan'),
                leading: Icon(Icons.remove), // add an icon
                onTap: () {
                  pengurangan(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('3. Cek Bilangan Ganjil/Genap'),
                leading: Icon(Icons.check), // add an icon
                onTap: () {
                  cekBilangan(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('4. Kelompok'),
                leading: Icon(Icons.group), // add an icon
                onTap: () {
                  tampilkanKelompok(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('5. Keluar'),
                leading: Icon(Icons.exit_to_app), // add an icon
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Konfirmasi'),
                        content: Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
                        actions: [
                          TextButton(
                            child: Text('Ya'),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                          ),
                          TextButton(
                            child: Text('Tidak'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Fungsi untuk login
bool login(String username, String password) {
  // Data username dan password yang benar
  String usernameBenar = 'admin';
  String passwordBenar = 'password';

  // Cek apakah username dan password yang dimasukkan benar
  if (username == usernameBenar && password == passwordBenar) {
    return true;
  } else {
    return false;
  }
}

// Fungsi untuk melakukan penjumlahan
void penjumlahan(BuildContext context) {
  final _angkaPertamaController = TextEditingController();
  final _angkaKeduaController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Penjumlahan'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _angkaPertamaController,
              decoration: InputDecoration(labelText: 'Angka pertama'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _angkaKeduaController,
              decoration: InputDecoration(labelText: 'Angka kedua'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  int angkaPertama = int.parse(_angkaPertamaController.text);
                  int angkaKedua = int.parse(_angkaKeduaController.text);
                  int hasil = angkaPertama + angkaKedua;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Hasil penjumlahan: $hasil')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Silakan masukkan angka yang valid')),
                  );
                }
              },
              child: Text('Hitung'),
            ),
          ],
        ),
      );
    },
  );
}

// Fungsi untuk melakukan pengurangan
void pengurangan(BuildContext context) {
  final _angkaPertamaController = TextEditingController();
  final _angkaKeduaController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Pengurangan'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _angkaPertamaController,
              decoration: InputDecoration(labelText: 'Angka pertama'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _angkaKeduaController,
              decoration: InputDecoration(labelText: 'Angka kedua'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  int angkaPertama = int.parse(_angkaPertamaController.text);
                  int angkaKedua = int.parse(_angkaKeduaController.text);
                  int hasil = angkaPertama - angkaKedua;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Hasil pengurangan: $hasil')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Silakan masukkan angka yang valid')),
                  );
                }
              },
              child: Text('Hitung'),
            ),
          ],
        ),
      );
    },
  );
}

// Fungsi untuk cek bilangan ganjil/genap
void cekBilangan(BuildContext context) {
  final _angkaController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Cek Bilangan Ganjil/Genap'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _angkaController,
              decoration: InputDecoration(labelText: 'Angka'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  int angka = int.parse(_angkaController.text);
                  if (angka % 2 == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Bilangan genap')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Bilangan ganjil')),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Silakan masukkan angka yang valid')),
                  );
                }
              },
              child: Text('Cek'),
            ),
          ],
        ),
      );
    },
  );
}

// Fungsi untuk menampilkan data kelompok
void tampilkanKelompok(BuildContext context) {
  List<Kelompok> kelompok = [
    Kelompok(nama: 'Muhammad Salman Mahdi', nim: '124220014'),
    Kelompok(nama: 'Dimas Rahmadhan', nim: '124220024'),
  ];

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Data Kelompok'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < kelompok.length; i++)
              Column(
                children: [
                  Text('Nama: ${kelompok[i].nama} / ${kelompok[i].nim}'),
                  SizedBox(height: 10),
                ],
              ),
          ],
        ),
      );
    },
  );
}

class Kelompok {
  String nama;
  String nim;

  Kelompok({required this.nama, required this.nim});
}