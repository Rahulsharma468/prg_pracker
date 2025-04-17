import 'package:flutter/material.dart';
import 'package:pg_tracker/models/onboarding_model.dart';
import '../services/onboarding_service.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingMongoDBService _onboardingService =
      OnboardingMongoDBService();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _bodyFatPercentageController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text.trim();
      String weight = _weightController.text.trim();
      String age = _ageController.text.trim();
      String height = _heightController.text.trim();
      String bodyFatPercentage = _bodyFatPercentageController.text.trim();

      print("Name: $name");
      print("Age: $age");
      print("Weight: $weight");
      print("Height: $height");
      print("Body Fat Percentage: $bodyFatPercentage");

      Map<dynamic, dynamic> uploadedResponse = await _onboardingService
          .saveOnboardingData(
            ExerciseModel(
              name: name,
              weight: weight,
              age: double.parse(age),
              height: height,
              bodyFatPercentage: double.parse(bodyFatPercentage),
            ),
          );

      print("Response :::  $uploadedResponse");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Data saved successfully')));

      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _bodyFatPercentageController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Onboarding')),
      body: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset('assets/images/splash_logo.webp'),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                          validator:
                              (value) =>
                                  value == null || value.isEmpty
                                      ? "Enter your name"
                                      : null,
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          spacing: 4.0,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _weightController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Weight',
                                ),
                                validator:
                                    (value) =>
                                        value == null || value.isEmpty
                                            ? "Enter your Weight"
                                            : null,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _ageController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Age',
                                ),
                                validator:
                                    (value) =>
                                        value == null || value.isEmpty
                                            ? "Enter your Age"
                                            : null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          spacing: 4.0,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _heightController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Height',
                                ),
                                validator:
                                    (value) =>
                                        value == null || value.isEmpty
                                            ? "Enter your Height"
                                            : null,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _bodyFatPercentageController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Fat %',
                                ),
                                validator:
                                    (value) =>
                                        value == null || value.isEmpty
                                            ? "Enter your Fat %"
                                            : null,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: _saveForm,
                          child: Text("Save"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
    );
  }
}
