import 'package:flutter/material.dart';
import '../models/tugas.dart';
import 'daftar_form_screen.dart';

class DetailTugasScreen extends StatelessWidget {
  final Tugas tugas;

  const DetailTugasScreen({super.key, required this.tugas});

  Widget _baris(String label, String nilai) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(': '),
          Expanded(child: Text(nilai)),
        ],
      ),
    );
  }

  @override
  Future<void> _ubah(BuildContext context) async {
    final hasil = await Navigator.push<Tugas>(
      context,
      MaterialPageRoute(builder: (_) => FormTugasScreen(tugas: tugas)),
    );
    if (hasil != null && context.mounted) {
      Navigator.pop(context, {'aksi': 'ubah', 'tugas': hasil});
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _baris('ID', tugas.id),
            _baris('Judul', tugas.judul),
            _baris('Mata Kuliah', tugas.mataKuliah),
            _baris('Deskripsi', tugas.deskripsi),
            _baris('Tenggat', tugas.tenggat),
            _baris('Prioritas', tugas.prioritas),
            _baris('Status', tugas.selesai ? 'Selesai' : 'Belum selesai'),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => _ubah(context), // diisi pada tahap 9
                    icon: const Icon(Icons.edit),
                    label: const Text('Ubah'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {}, // diisi pada tahap 10
                    icon: const Icon(Icons.delete),
                    label: const Text('Hapus'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
