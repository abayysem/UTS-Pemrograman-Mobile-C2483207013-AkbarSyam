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

  void _simpan() {
    final hasil = Tugas(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      judul: _judulController.text.trim(),
      mataKuliah: _mataKuliahController.text.trim(),
      deskripsi: _deskripsiController.text.trim(),
      tenggat: _tenggatController.text.trim(),
      prioritas: _prioritas ?? 'Rendah',
    );
    Navigator.pop(context, hasil);
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
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _mataKuliahController,
                decoration: const InputDecoration(
                  labelText: 'Mata Kuliah',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _deskripsiController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi',
                  border: OutlineInputBorder(),
                ),
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
