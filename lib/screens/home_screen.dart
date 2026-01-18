import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/medicine_provider.dart';
import '../widgets/medicine_tile.dart';
import 'add_medicine_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MedicineProvider>();
    final medicines = provider.medicines;

    return Scaffold(
      appBar: AppBar(title: const Text('Medicine Reminder')),
      body: medicines.isEmpty
          ? const Center(
              child: Text(
                'No medicines added yet',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                return MedicineTile(medicine: medicines[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddMedicineScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
