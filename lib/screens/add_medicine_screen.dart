import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/medicine_model.dart';
import '../providers/medicine_provider.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _nameController = TextEditingController();
  final _doseController = TextEditingController();
  TimeOfDay? _selectedTime;

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  void _save() {
    if (_nameController.text.isEmpty ||
        _doseController.text.isEmpty ||
        _selectedTime == null) {
      return;
    }

    final now = DateTime.now();
    final time = DateTime(
      now.year,
      now.month,
      now.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    final medicine = Medicine(
      name: _nameController.text,
      dose: _doseController.text,
      time: time,
      notificationId: DateTime.now().millisecondsSinceEpoch ~/ 1000,
    );

    context.read<MedicineProvider>().addMedicine(medicine);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Medicine')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Medicine Name'),
            ),
            TextField(
              controller: _doseController,
              decoration: const InputDecoration(labelText: 'Dose'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  _selectedTime == null
                      ? 'No time selected'
                      : _selectedTime!.format(context),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _pickTime,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: const Text('Pick Time'),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
