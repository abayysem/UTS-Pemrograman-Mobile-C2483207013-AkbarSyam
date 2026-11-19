import 'package:flutter/material.dart';
import '../models/tugas.dart';
import '../widgets/kartu_tugas.dart';
import 'daftar_form_screen.dart';
import 'detail_tugas_screen.dart';

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

  Widget _kotakRingkasan(String label, int jumlah, Color warna) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: warna.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              '$jumlah',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: warna,
              ),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }

  void _pesan(String teks) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(teks)));
  }

  Future<void> _tambahTugas() async {
    final hasil = await Navigator.push<Tugas>(
      context,
      MaterialPageRoute(builder: (_) => const FormTugasScreen()),
    );
    if (!mounted || hasil == null) return;
    setState(() {
      _daftarTugas.add(hasil);
    });
    _pesan('Tugas berhasil ditambahkan');
  }

  Future<void> _bukaDetail(Tugas tugas) async {
    final hasil = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(builder: (_) => DetailTugasScreen(tugas: tugas)),
    );
    if (!mounted || hasil == null) return;

    if (hasil['aksi'] == 'ubah') {
      final tugasBaru = hasil['tugas'] as Tugas;
      final index = _daftarTugas.indexWhere((t) => t.id == tugasBaru.id);
      if (index != -1) {
        setState(() {
          _daftarTugas[index] = tugasBaru;
        });
        _pesan('Tugas berhasil diperbarui');
      }
    } else if (hasil['aksi'] == 'hapus') {
      final index = _daftarTugas.indexWhere((t) => t.id == hasil['id']);
      if (index != -1) {
        setState(() {
          _daftarTugas.removeAt(index);
        });
        _pesan('Tugas berhasil dihapus');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = _daftarTugas.length;
    final selesai = _daftarTugas.where((t) => t.selesai).length;
    final belum = total - selesai;

    return Scaffold(
      appBar: AppBar(
        title: const Text('TugasKu'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                _kotakRingkasan('Total', total, Colors.indigo),
                _kotakRingkasan('Selesai', selesai, Colors.green),
                _kotakRingkasan('Belum', belum, Colors.orange),
              ],
            ),
          ),
          Expanded(
            child: _daftarTugas.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        'Belum ada tugas.\nTekan tombol + untuk menambah tugas.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _daftarTugas.length,
                    itemBuilder: (context, index) {
                      final tugas = _daftarTugas[index];
                      return KartuTugas(
                        tugas: tugas,
                        onTap: () => _bukaDetail(tugas), // diisi pada tahap 8
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _tambahTugas,
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
    );
  }
}
