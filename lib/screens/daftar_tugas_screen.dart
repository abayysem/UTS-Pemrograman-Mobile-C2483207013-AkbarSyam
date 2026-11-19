import 'package:flutter/material.dart';
import '../models/tugas.dart';

class DaftarTugasScreen extends StatefulWidget {
  const DaftarTugasScreen({super.key});

  @override
  State<DaftarTugasScreen> createState() => _DaftarTugasScreenState();
}

class _DaftarTugasScreenState extends State<DaftarTugasScreen> {
  final List<Tugas> _daftarTugas = [
    const Tugas(
      id: '1',
      judul: 'Laporan Praktikum Flutter',
      mataKuliah: 'Pemrograman Mobile',
      deskripsi: 'Menyusun laporan PDF beserta screenshot aplikasi.',
      tenggat: '25-11-2026',
      prioritas: 'Tinggi',
    ),
    const Tugas(
      id: '2',
      judul: 'Rancangan Basis Data',
      mataKuliah: 'Basis Data',
      deskripsi: 'Membuat ERD dan tabel relasi untuk sistem perpustakaan.',
      tenggat: '30-11-2026',
      prioritas: 'Sedang',
    ),
    const Tugas(
      id: '3',
      judul: 'Resume Jurnal Pembelajaran',
      mataKuliah: 'Media Pembelajaran',
      deskripsi: 'Meresume satu jurnal tentang media pembelajaran digital.',
      tenggat: '05-12-2026',
      prioritas: 'Rendah',
      selesai: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TugasKu'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: _daftarTugas.length,
        itemBuilder: (context, index) {
          final tugas = _daftarTugas[index];
          return ListTile(
            title: Text(tugas.judul),
            subtitle: Text('${tugas.mataKuliah} • ${tugas.tenggat}'),
            trailing: Text(tugas.prioritas),
          );
        },
      ),
    );
  }
}
