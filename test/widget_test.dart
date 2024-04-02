import 'package:flutter/material.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                // Option 1: AppBar with constant values (Simple)
                 AppBar(
                  title: Text('Instructions'),
                  backgroundColor: Colors.transparent,
                  elevation: 0, // Remove app bar shadow
                ),

                // Option 2 (uncomment if needed): Custom ConstAppBar (Reusable)
                // MyConstAppBar(title: 'Instructions'),

                SizedBox(height: 16), // Add spacing after app bar
                Text(
                  'FlexiSense Companion - Quick Start',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16), // Add spacing before instructions
                // Use a numbered list for better readability
                ...List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      '${index + 1}. ${_instructions[index]}',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Store instructions for easier maintenance
  final List<String> _instructions = const [
    'Glove Fit: Wear the glove snugly, sensors on fingertips.',
    'Wi-Fi Connect: Ensure continuous connection of the gloves to the Wi-Fi.',
    'Gestures: The gestures have predefined meanings displayed on the RealTime Database screen.',
    'Real-time Data: RealTime Data is displayed on the screen provided the connectivity on both sides is stable.',
  ];
}

// Option 2 (uncomment if needed): Custom ConstAppBar class
class MyConstAppBar extends StatelessWidget {
  const MyConstAppBar({
    required this.title,
    this.backgroundColor = Colors.transparent,
    this.elevation = 0,
  });

  final String title;
  final Color backgroundColor;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: backgroundColor,
      elevation: elevation,
    );
  }
}
