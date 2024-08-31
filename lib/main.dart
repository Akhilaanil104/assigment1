import 'package:assignment1/providers/addmedicine_provider.dart';
import 'package:assignment1/providers/device_provider.dart';
import 'package:assignment1/screens/addmedicine.dart';
import 'package:assignment1/screens/devicesettingspage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddMedicineInfoProvider()),
        ChangeNotifierProvider(create: (_) => DeviceSettingsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'assigment1',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: DeviceSettingsPage(),
    );
  }
}
