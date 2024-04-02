import 'package:flutter/material.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpeg'),
            fit: BoxFit.cover, // Ensure full-screen background
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                // AppBar with transparent background, centered title, and no leading icon
                AppBar(
                  title: Center(
                    child: Text(
                      'Instructions',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Set title color to white
                      ),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  automaticallyImplyLeading: false, // Remove back button icon
                ),
                SizedBox(height: 16),
                Text(
                  'FlexiSense Companion - Quick Start',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Adjust text color for contrast
                  ),
                ),
                SizedBox(height: 16), // Add spacing before instructions
                // Use a numbered list for better readability
                ...List.generate(_instructions.length, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${index + 1}.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Adjust text color for contrast
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        _instructions[index],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Adjust text color for contrast
                        ),
                      ),
                      SizedBox(height: 16), // Add spacing between instructions and image
                      Image.asset(
                        _instructionImages[index],
                        width: double.infinity, // Set image width to fill the screen
                        fit: BoxFit.cover, // Ensure image covers the entire space
                      ),
                    ],
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
    'Glove Fit: Wear the glove snugly, with sensors on fingertips.',
    'Wi-Fi Connect: Ensure continuous connection of the gloves to the Wi-Fi.',
    'Gestures: The gestures have predefined meanings displayed on the RealTime Database screen.',
    'Real-time Data: RealTime Data is displayed on the screen provided the connectivity on both sides is stable.'
  ];

  // Define image paths for each instruction
  final List<String> _instructionImages = const [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
  ];
}
