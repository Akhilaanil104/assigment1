import 'package:assignment1/providers/device_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/common_widgets.dart';

class DeviceSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device settings'),
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Consumer<DeviceSettingsProvider>(
        builder: (context, provider, child) {
          return ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              _buildVacationTimeSection(provider),
              _buildToggleSection(provider, 'Show meds name', provider.showMedsName, provider.toggleShowMedsName),
              _buildToggleSection(provider, 'Notify pharma to autofill', provider.notifyPharma, provider.toggleNotifyPharma),
              _buildToggleSection(provider, 'Add sorry time', provider.addSorryTime, provider.toggleAddSorryTime),
              CommonWidgets.buildOccupiedCabinetsTile(),
              SizedBox(height: 8),
              _buildAlarmSettingsSection(provider),
            ],
          );
        },
      ),
    );
  }

  Widget _buildVacationTimeSection(DeviceSettingsProvider provider) {
    return _buildSection(
      title: 'Set vacation time',
      isActive: provider.isVacationTimeSet,
      onChanged: provider.toggleVacationTime,
      content: provider.isVacationTimeSet
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Start date & time"),
                  CommonWidgets.buildDateTimePicker('DD/MM/YYYY        HH:MM'),
                  SizedBox(height: 8),
                  Text("End date & time"),
                  CommonWidgets.buildDateTimePicker('DD/MM/YYYY        HH:MM'),
                ],
              ),
            )
          : Container(),
    );
  }

  Widget _buildToggleSection(DeviceSettingsProvider provider, String title, bool value, Function(bool) toggle) {
    return _buildSection(
      title: title,
      isActive: value,
      onChanged: toggle,
      content: Container(),
    );
  }

  Widget _buildSection({
    required String title,
    required bool isActive,
    required Widget content,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: isActive ? Colors.teal : Colors.grey.shade300, width: 1.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          SwitchListTile(
            title: Text(title),
            value: isActive,
            activeColor: Colors.teal,
            onChanged: onChanged,
          ),
          if (isActive) content,
        ],
      ),
    );
  }

  Widget _buildAlarmSettingsSection(DeviceSettingsProvider provider) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Alarm settings', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          _buildAlarmOptionTile(provider, 'Alarm tune', provider.selectedAlarmTune, ['Rooster', 'Bell', 'Chime'], provider.updateAlarmTune),
          _buildAlarmOptionTile(provider, 'Alarm strength', provider.selectedAlarmStrength, ['Louder', 'Normal', 'Softer'], provider.updateAlarmStrength),
          _buildAlarmOptionTile(provider, 'Snooze', provider.selectedSnoozeTime, ['5mins', '10mins', '15mins'], provider.updateSnoozeTime),
        ],
      ),
    );
  }

  Widget _buildAlarmOptionTile(DeviceSettingsProvider provider, String label, String? value, List<String> items, Function(String?) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
        value: value,
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
}
