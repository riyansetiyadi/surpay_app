import 'package:flutter/material.dart';
import 'package:surpay_app/widgets/drawer/main_drawer.dart';
import 'package:surpay_app/widgets/navigation_bar/user_app_bar.dart';

class SurveyPageScreen extends StatefulWidget {
  const SurveyPageScreen({super.key});

  @override
  State<SurveyPageScreen> createState() => _SurveyPageScreenState();
}

class _SurveyPageScreenState extends State<SurveyPageScreen> {
  int? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserAppBar(),
      drawer: const MainDrawer(),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                      height: 40,
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          'Judul Survey',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      )),
                  RadioListTile<int>(
                    title: const Text("Option 1"),
                    value: 1,
                    groupValue: _selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: const Text("Option 2"),
                    value: 1,
                    groupValue: _selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: const Text("Option 3"),
                    value: 1,
                    groupValue: _selectedValue,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
