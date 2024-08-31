import 'package:flutter/material.dart';

class DeviceSettingsProvider extends ChangeNotifier {
  bool isVacationTimeSet = false;
  bool showMedsName = false;
  bool notifyPharma = false;
  bool addSorryTime = false;

  String? selectedAlarmTune = 'Rooster';
  String? selectedAlarmStrength = 'Louder';
  String? selectedSnoozeTime = '5mins';

  void toggleVacationTime(bool value) {
    isVacationTimeSet = value;
    notifyListeners();
  }

  void toggleShowMedsName(bool value) {
    showMedsName = value;
    notifyListeners();
  }

  void toggleNotifyPharma(bool value) {
    notifyPharma = value;
    notifyListeners();
  }

  void toggleAddSorryTime(bool value) {
    addSorryTime = value;
    notifyListeners();
  }

  void updateAlarmTune(String? value) {
    selectedAlarmTune = value;
    notifyListeners();
  }

  void updateAlarmStrength(String? value) {
    selectedAlarmStrength = value;
    notifyListeners();
  }

  void updateSnoozeTime(String? value) {
    selectedSnoozeTime = value;
    notifyListeners();
  }
}
