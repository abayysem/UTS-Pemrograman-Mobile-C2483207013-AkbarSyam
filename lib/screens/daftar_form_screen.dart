import 'package:flutter/material.dart';
import '../models/tugas.dart';

class FormTugasScreen extends StatefulWidget {
  const FormTugasScreen({super.key});

  @override
  State<FormTugasScreen> createState() => _FormTugasScreenState();
}

class _FormTugasScreenState extends State<FormTugasScreen> {
  final _formKey = GlobalKey<FormState>();
  final _judulController = TextEditingController();
  final _mataKuliahController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _tenggatController = TextEditingController();

  String? _prioritas;

  @override
  void dispose() {
    _judulController.dispose();
    _mataKuliahController.dispose();
    _deskripsiController.dispose();
    _tenggatController.dispose();
    super.dispose();
  }

  // validasi
  String? _validasiJudul(String? v) {
    if (v == null || v.trim().isEmpty) return 'Judul tidak boleh kosong';
    if (v.trim().length < 3) return 'Judul minimal 3 karakter';
    return null;
  }

  String? _validasiMataKuliah(String? v) {
    if (v == null || v.trim().isEmpty) return 'Mata kuliah tidak boleh kosong';
    return null;
  }

  String? _validasiDeskripsi(String? v) {
    if (v == null || v.trim().isEmpty) return 'Deskripsi tidak boleh kosong';
    if (v.trim().length < 10) return 'Deskripsi minimal 10 karakter';
    return null;
  }

  String? _validasiTenggat(String? v) {
    if (v == null || v.trim().isEmpty) return 'Tenggat tidak boleh kosong';
    final teks = v.trim();
    if (!RegExp(r'^\d{2}-\d{2}-\d{4}$').hasMatch(teks)) {
      return 'Format harus DD-MM-YYYY';
    }
    final bagian = teks.split('-');
    final hari = int.parse(bagian[0]);
    final bulan = int.parse(bagian[1]);
    final tahun = int.parse(bagian[2]);

    // DateTime menggeser tanggal tidak nyata (31-02 menjadi 03-03),
    // jadi hasilnya dibandingkan lagi dengan input asli.
    final tanggal = DateTime(tahun, bulan, hari);
    if (tanggal.day != hari ||
        tanggal.month != bulan ||
        tanggal.year != tahun) {
      return 'Tanggal tidak nyata (mis. 31-02-2026)';
    }
    return null;
  }

  String? _validasiPrioritas(String? v) {
    if (v == null || v.isEmpty) return 'Prioritas wajib dipilih';
    return null;
  }

  void _simpan() {
    if (_formKey.currentState!.validate()) {
      final hasil = Tugas(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        judul: _judulController.text.trim(),
        mataKuliah: _mataKuliahController.text.trim(),
        deskripsi: _deskripsiController.text.trim(),
        tenggat: _tenggatController.text.trim(),
        prioritas: _prioritas!,
      );
      Navigator.pop(context, hasil);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Tugas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _judulController,
                decoration: const InputDecoration(
                  labelText: 'Judul Tugas',
                  border: OutlineInputBorder(),
                ),
                validator: _validasiJudul,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _mataKuliahController,
                decoration: const InputDecoration(
                  labelText: 'Mata Kuliah',
                  border: OutlineInputBorder(),
                ),
                validator: _validasiMataKuliah,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _deskripsiController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(),
                ),
                validator: _validasiDeskripsi,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tenggatController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  labelText: 'Tenggat (DD-MM-YYYY)',
                  hintText: 'contoh: 25-11-2026',
                  border: OutlineInputBorder(),
                ),
                validator: _validasiTenggat,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _prioritas,
                decoration: const InputDecoration(
                  labelText: 'Prioritas',
                  border: OutlineInputBorder(),
                ),
                items: const ['Rendah', 'Sedang', 'Tinggi']
                    .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                    .toList(),
                onChanged: (v) => setState(() => _prioritas = v),
                validator: _validasiPrioritas,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _simpan,
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
