





import 'package:assignment1/models/alaram_entry_model.dart';
import 'package:assignment1/providers/addmedicine_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddMedicineInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Add Medicine Info',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Implement the next step action
            },
            child: Text('Next', style: TextStyle(color: Colors.teal)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<AddMedicineInfoProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Medicine",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Enter name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Frequency',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Column(
                          children: [
                            _buildFrequencyRadio(provider, 0, 'Daily'),
                            _buildFrequencyRadio(provider, 1, 'Specific days'),
                            _buildFrequencyRadio(provider, 2, 'Interval'),
                            _buildFrequencyRadio(provider, 3, 'As needed'),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Set time & dose',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: provider.alarms.length,
                          itemBuilder: (context, index) {
                            return _buildAlarmEntry(provider.alarms[index]);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<AddMedicineInfoProvider>().addAlarm(AlarmEntry(time: '08:00', dose: '5 ml'));
        },
        backgroundColor: Colors.white,
        icon: Icon(Icons.add,color:  Colors.teal,),
        label: Text('Add more alarm',style: TextStyle(color: Colors.teal),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildFrequencyRadio(AddMedicineInfoProvider provider, int value, String title) {
    return RadioListTile(
      activeColor: Colors.teal,
      title: Text(title),
      value: value,
      groupValue: provider.selectedFrequency,
      onChanged: (value) {
        provider.updateFrequency(value!);
      },
    );
  }

  Widget _buildAlarmEntry(AlarmEntry alarm) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Text(alarm.time, style: TextStyle(fontSize: 16)),
            Spacer(),
            Text(alarm.dose, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}









