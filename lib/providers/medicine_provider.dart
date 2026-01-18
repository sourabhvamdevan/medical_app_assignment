import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/medicine_model.dart';
import '../services/notification_service.dart';

class MedicineProvider extends ChangeNotifier {
  final Box<Medicine> _box = Hive.box<Medicine>('medicines');

  List<Medicine> get medicines {
    final list = _box.values.toList();
    list.sort((a, b) => a.time.compareTo(b.time));
    return list;
  }

  Future<void> addMedicine(Medicine medicine) async {
    await _box.add(medicine);

    await NotificationService().scheduleNotification(
      id: medicine.notificationId,
      title: 'Medicine Reminder',
      body: '${medicine.name} - ${medicine.dose}',
      time: medicine.time,
    );

    notifyListeners();
  }
}
