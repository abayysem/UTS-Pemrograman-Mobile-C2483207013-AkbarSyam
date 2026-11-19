import 'package:flutter/material.dart';
import '../models/tugas.dart';

class KartuTugas extends StatelessWidget {
  final Tugas tugas;
  final VoidCallback onTap;

  const KartuTugas({super.key, required this.tugas, required this.onTap});

  Color _warnaPrioritas() {
    switch (tugas.prioritas) {
      case 'Tinggi':
        return Colors.red;
      case 'Sedang':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(
                tugas.selesai
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: tugas.selesai ? Colors.green : Colors.grey,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tugas.judul,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: tugas.selesai
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(tugas.mataKuliah),
                    Text('Tenggat: ${tugas.tenggat}'),
                    Text(
                      tugas.selesai
                          ? 'Status: Selesai'
                          : 'Status: Belum selesai',
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _warnaPrioritas(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tugas.prioritas,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
