import 'package:flutter/material.dart';

void main() {
  runApp(DigitalPetApp());
}

class DigitalPetApp extends StatefulWidget {
  @override
  _DigitalPetAppState createState() => _DigitalPetAppState();
}

class _DigitalPetAppState extends State<DigitalPetApp> {
  int happinessLevel = 50; // Happiness starts at 50

  // Function to feed the pet
  void feedPet() {
    setState(() {
      happinessLevel += 10;
      if (happinessLevel > 100) happinessLevel = 100;
    });
  }

  // Function to play with the pet
  void playWithPet() {
    setState(() {
      happinessLevel += 15;
      if (happinessLevel > 100) happinessLevel = 100;
    });
  }

  // Function to put the pet to sleep
  void putPetToSleep() {
    setState(() {
      happinessLevel -= 10;
      if (happinessLevel < 0) happinessLevel = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Use a ThemeData to define your white/gray color scheme
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.grey.shade600,           // Gray app bar
          titleTextStyle: TextStyle(
            color: Colors.black,                // Dark text on app bar
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade400), 
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
        ),
        // You can also adjust other text colors globally if needed
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Digital Pet'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Make sure the path matches the asset folder in pubspec.yaml
            Image.asset('assets/puppy.jpeg', height: 150), // Pet image
            SizedBox(height: 20),
            Text(
              'Happiness: $happinessLevel%',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,            // Ensure text is visible
              ),
            ),
            SizedBox(height: 20),
            // Progress bar in gray
            LinearProgressIndicator(
              value: happinessLevel / 100,
              backgroundColor: Colors.grey.shade300,
              color: Colors.grey.shade600,     // Gray fill
              minHeight: 10,
            ),
            SizedBox(height: 30),
            // Buttons to interact with the pet
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: feedPet,
                  child: Text('Feed'),
                ),
                ElevatedButton(
                  onPressed: playWithPet,
                  child: Text('Play'),
                ),
                ElevatedButton(
                  onPressed: putPetToSleep,
                  child: Text('Sleep'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
///third