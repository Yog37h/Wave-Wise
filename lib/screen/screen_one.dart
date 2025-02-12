import 'package:flutter/material.dart';
import 'dart:async';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final List<Map<String, dynamic>> hubs = List.generate(
    10,
        (index) => {
      "title": "Fishing Hub ${index + 1}",
      "subtitle": "Chennai",
      "entriesMade": 0,
    },
  );

  bool isIncrementDelayed = false;

  // Function to increment "entries made" value
  void incrementEntries(int index) {
    setState(() {
      hubs[index]["entriesMade"]++;
    });
    isIncrementDelayed = true;

    // Reset delay to 5 seconds after the first press
    Timer(Duration(seconds: 5), () {
      setState(() {
        isIncrementDelayed = false;
      });
    });
  }

  // Refresh button pressed handler
  void onRefreshPressed(int index) {
    if (!isIncrementDelayed) {
      incrementEntries(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'View your saved hubs',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
              Colors.blue.shade500,
              Colors.blue.shade600,
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: hubs.length,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Subtitle
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      hubs[index]["title"],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                    ),
                    subtitle: Text(
                      hubs[index]["subtitle"],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Date and Time Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date: ${DateTime.now().toLocal().toString().split(' ')[0]}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      Text(
                        "Time: ${DateTime.now().toLocal().toString().split(' ')[1].split('.')[0]}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Entries Made and Refresh Button Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Entries Made: ${hubs[index]["entriesMade"]}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      IconButton(
                        onPressed: () => onRefreshPressed(index),
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
