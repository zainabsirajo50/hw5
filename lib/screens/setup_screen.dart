import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class SetupScreen extends StatefulWidget {
  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  int _numQuestions = 10;
  String _category = "9"; // Default category: General Knowledge
  String _difficulty = "easy";
  String _type = "multiple";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Customize Your Quiz',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<int>(
              value: _numQuestions,
              decoration: InputDecoration(labelText: "Number of Questions"),
              items: [5, 10, 15]
                  .map((value) =>
                      DropdownMenuItem(value: value, child: Text('$value')))
                  .toList(),
              onChanged: (value) => setState(() => _numQuestions = value!),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _category,
              decoration: InputDecoration(labelText: "Category"),
              items: [
                {"id": "9", "name": "General Knowledge"},
                {"id": "21", "name": "Sports"},
                {"id": "11", "name": "Movies"}
              ].map((cat) {
                return DropdownMenuItem(
                  value: cat["id"],
                  child: Text(cat["name"]!),
                );
              }).toList(),
              onChanged: (value) => setState(() => _category = value!),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _difficulty,
              decoration: InputDecoration(labelText: "Difficulty"),
              items: ["easy", "medium", "hard"]
                  .map((value) =>
                      DropdownMenuItem(value: value, child: Text(value)))
                  .toList(),
              onChanged: (value) => setState(() => _difficulty = value!),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _type,
              decoration: InputDecoration(labelText: "Type"),
              items: [
                {"id": "multiple", "name": "Multiple Choice"},
                {"id": "boolean", "name": "True/False"}
              ].map((type) {
                return DropdownMenuItem(
                  value: type["id"],
                  child: Text(type["name"]!),
                );
              }).toList(),
              onChanged: (value) => setState(() => _type = value!),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      numQuestions: _numQuestions,
                      category: _category,
                      difficulty: _difficulty,
                      type: _type,
                    ),
                  ),
                );
              },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}