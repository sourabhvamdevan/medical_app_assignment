import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/medicine_model.dart';

class MedicineTile extends StatelessWidget {
  final Medicine medicine;
  const MedicineTile({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const Icon(Icons.medication, color: Colors.teal),
        title: Text(medicine.name),
        subtitle: Text(
          '${medicine.dose} • ${DateFormat.jm().format(medicine.time)}',
        ),
      ),
    );
  }
}
