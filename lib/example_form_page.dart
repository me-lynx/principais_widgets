import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  String _name = "";
  bool _isStudent = false;
  int _selectedGender = 0;
  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name',
              style: TextStyle(fontSize: 18.0),
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter your name',
              ),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            CheckboxListTile(
              title: const Text('I am a student'),
              value: _isStudent,
              onChanged: (value) {
                setState(() {
                  _isStudent = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Gender',
              style: TextStyle(fontSize: 18.0),
            ),
            RadioListTile(
              title: const Text('Male'),
              value: 0,
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value as int;
                });
              },
            ),
            RadioListTile(
              title: const Text('Female'),
              value: 1,
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value as int;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Age',
              style: TextStyle(fontSize: 18.0),
            ),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
