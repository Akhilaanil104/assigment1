import 'package:flutter/material.dart';

class CommonWidgets {
  static Widget buildDateTimePicker(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      readOnly: true,
      onTap: () {
        
      },
    );
  }

  static Widget buildOccupiedCabinetsTile() {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text('Occupied cabinets'),
        subtitle: Text('1, 2, 3, 4, 5'),
        onTap: () {
          
        },
      ),
    );
  }
}
