import 'package:flutter/material.dart';

class PelangganPage extends StatefulWidget {
  const PelangganPage({super.key});

  @override
  _PelangganPageState createState() => _PelangganPageState();
}

class _PelangganPageState extends State<PelangganPage> {
  final List<Map<String, String>> pelangganList = [
    {"nama": "Andi", "telepon": "081234567890"},
    {"nama": "Budi", "telepon": "082345678901"},
    {"nama": "Citra", "telepon": "083456789012"},
  ];

  void _tambahPelanggan() {
    TextEditingController namaController = TextEditingController();
    TextEditingController teleponController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Tambah Pelanggan"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: namaController, decoration: const InputDecoration(labelText: "Nama Pelanggan")),
            TextField(controller: teleponController, decoration: const InputDecoration(labelText: "No. Telepon"), keyboardType: TextInputType.phone),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                pelangganList.add({
                  "nama": namaController.text,
                  "telepon": teleponController.text,
                });
              });
              Navigator.pop(context);
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pelanggan')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: pelangganList.length,
        itemBuilder: (context, index) {
          final pelanggan = pelangganList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              title: Text(pelanggan["nama"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("Telepon: ${pelanggan["telepon"]}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    pelangganList.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahPelanggan,
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
