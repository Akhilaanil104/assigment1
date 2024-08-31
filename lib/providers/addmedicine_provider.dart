import 'package:assignment1/models/alaram_entry_model.dart';
import 'package:assignment1/screens/addmedicine.dart';
import 'package:flutter/material.dart';


class AddMedicineInfoProvider extends ChangeNotifier {
  int _selectedFrequency = 0;
  List<AlarmEntry> _alarms = [AlarmEntry(time: '08:00', dose: '5 ml')];

  int get selectedFrequency => _selectedFrequency;
  List<AlarmEntry> get alarms => _alarms;

  void updateFrequency(int value) {
    _selectedFrequency = value;
    notifyListeners();
  }

  void addAlarm(AlarmEntry alarm) {
    _alarms.add(alarm);
    notifyListeners();
  }
}
