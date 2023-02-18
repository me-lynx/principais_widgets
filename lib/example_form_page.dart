import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  _MyFormPageState createState() {
    return _MyFormPageState();
  }
}

class _MyFormPageState extends State<MyFormPage> {
  String _name = '';
  bool _isStudent = false;
  int _selectedGender = 0;
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: TextStyle(fontSize: 18.0),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
              ),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            CheckboxListTile(
              title: Text('I am a student'),
              value: _isStudent,
              onChanged: (value) {
                setState(() {
                  _isStudent = value!;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Gender',
              style: TextStyle(fontSize: 18.0),
            ),
            RadioListTile(
              title: Text('Male'),
              value: 0,
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value as int;
                });
              },
            ),
            RadioListTile(
              title: Text('Female'),
              value: 1,
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = value as int;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
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
