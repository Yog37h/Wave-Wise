import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:ww1/screen/main_navigation_screen.dart'; // Add this import for Lottie animation

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _textController1;
  late AnimationController _textController2;

  @override
  void initState() {
    super.initState();
    // Initialize animation controllers with duration
    _textController1 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _textController2 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Start the animation once the controllers are initialized
    _textController1.forward();
    _textController2.forward();
  }

  @override
  void dispose() {
    // Dispose the controllers when the widget is destroyed
    _textController1.dispose();
    _textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade200, Colors.blue.shade600],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Using FutureBuilder to load the Lottie animation smoothly
              FutureBuilder(
                future: _loadLottieAnimation(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Show loading spinner while loading
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Lottie.asset(
                      'lib/assets/lottie/Animation.json',
                      width: 400,
                      height: 200,
                      fit: BoxFit.fitWidth,
                    );
                  }
                },
              ),

              const SizedBox(height: 40),

              // Fade-in and Glowing Text: "WaveWise"
              FadeTransition(
                opacity: _textController1,
                child: glowingText(),
              ),

              const SizedBox(height: 5), // Adjustable space between text

              // Fade-in and Glowing Text: "Safe and Smart Fishing System"
              FadeTransition(
                opacity: _textController2,
                child: glowingText2(),
              ),

              const SizedBox(height: 40),

              // Glowing Elevated Button
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
                  elevation: MaterialStateProperty.all(15),
                  shadowColor: MaterialStateProperty.all(Colors.orangeAccent),
                ),
                onPressed: () {
                  // Navigate to next screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainNavigationScreen(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                       fontSize: 18,
                      fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to load the Lottie animation (the Future is only for demonstration)
  Future<void> _loadLottieAnimation() async {
    await Future.delayed(const Duration(seconds: 0)); // Simulate animation load delay
  }

  Widget glowingText() {
    return Column(
      children: [
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 55.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.blueAccent.withOpacity(0.8),
                blurRadius: 15.0,
                offset: Offset(0, 0),
              ),
              Shadow(
                color: Colors.tealAccent.withOpacity(0.6),
                blurRadius: 20.0,
                offset: Offset(0, 0),
              ),
              Shadow(
                color: Colors.purpleAccent.withOpacity(0.4),
                blurRadius: 25.0,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TyperAnimatedText('WaveWise'),
            ],
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }

  Widget glowingText2() {
    return Column(
      children: [
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.blueAccent.withOpacity(0.8),
                blurRadius: 10.0,
                offset: Offset(0, 0),
              ),
              Shadow(
                color: Colors.tealAccent.withOpacity(0.6),
                blurRadius: 15.0,
                offset: Offset(0, 0),
              ),
              Shadow(
                color: Colors.purpleAccent.withOpacity(0.4),
                blurRadius: 20.0,
                offset: Offset(5, 5),
              ),
            ],
          ),
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TyperAnimatedText('Safe and smart fishing system', speed: Duration(milliseconds: 150)),
            ],
          ),
        ),
      ],
    );
  }
}
