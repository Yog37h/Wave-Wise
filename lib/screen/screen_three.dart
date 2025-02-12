import 'package:flutter/material.dart';
import 'package:ww1/screen/analysis_screen.dart'; // Import the new screen for analysis

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  _ScreenThreeState createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController hubController = TextEditingController();

  String predictedFishType = "None";
  double predictedFishCaughtKg = 0.0;
  double marketValue = 0.0;
  double successRate = 0.95; // Mockup value for success rate (95%)

  // Function to simulate the prediction process
  void predictFishType() {
    double distance = double.tryParse(distanceController.text) ?? 0.0;
    double productivity = 75; // Default value for productivity
    double fishingDuration = 0.0;

    try {
      DateTime startTime = DateTime.parse("2023-01-01 ${startTimeController.text}:00");
      DateTime endTime = DateTime.parse("2023-01-01 ${endTimeController.text}:00");
      fishingDuration = (endTime.difference(startTime).inSeconds) / 3600; // Calculate in hours
    } catch (e) {
      print('Error parsing time: $e');
    }

    predictedFishCaughtKg = (distance * productivity * fishingDuration) / 100; // Mockup formula
    marketValue = predictedFishCaughtKg * 200; // Mockup calculation for market value (per kg)
    predictedFishType = "Sardine";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Prediction Result'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Predicted Fish Type: $predictedFishType'),
              Text('Predicted Fish Caught (kg): ${predictedFishCaughtKg.toStringAsFixed(2)} kg'),
              Text('Market Value of Caught Fish: \$${marketValue.toStringAsFixed(2)}'),
              Text('Your Work Success Rate: ${(successRate * 100).toStringAsFixed(0)}%'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Navigate to analysis screen
  void navigateToAnalysisScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AnalysisScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fish Prediction Screen',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade800,
        elevation: 4,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade100,
              Colors.blue.shade300,
              Colors.blue.shade600,
              Colors.blue.shade800,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: distanceController,
                    decoration: InputDecoration(
                      labelText: 'Distance (km)',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: startTimeController,
                    decoration: InputDecoration(
                      labelText: 'Start Time (HH:MM)',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: endTimeController,
                    decoration: InputDecoration(
                      labelText: 'End Time (HH:MM)',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Boat Type',
                      border: OutlineInputBorder(),
                    ),
                    items: [
                      DropdownMenuItem(value: 'Small', child: Text('Small')),
                      DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                      DropdownMenuItem(value: 'Large', child: Text('Large')),
                    ],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: districtController,
                    decoration: InputDecoration(
                      labelText: 'District',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: hubController,
                    decoration: InputDecoration(
                      labelText: 'Hub',
                      border: OutlineInputBorder(),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: predictFishType,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      backgroundColor: Colors.blue.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Predict Fish Type',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: navigateToAnalysisScreen,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                      backgroundColor: Colors.blue.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'View Analysis',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
