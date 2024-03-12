import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const duration = Duration(seconds: 4);
    Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/welcome_lottie.json'),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final class _HomeViewState extends State<HomeView> {
  bool isLottieVisible = false;
  double blurAmount = 10.0; // Initial blur amount
  double sharpenProgress = 0.0;
  bool isProcessing = false;

  // Function to simulate sharpening process
  void startSharpeningProcess() {
    setState(() {
      isProcessing = true;
      isLottieVisible = true;
    });

    simulateSharpeningProcess();
  }

  void simulateSharpeningProcess() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        // Decrease blur and increase progress
        blurAmount -= 1.0;
        sharpenProgress = ((10.0 - blurAmount) / 10) *
            100; // Calculate progress as a percentage
        if (blurAmount > 0 && isProcessing) {
          simulateSharpeningProcess(); // Continue sharpening if not paused or stopped
        } else {
          isLottieVisible =
              false; // Hide Lottie animation when process completes or paused
          isProcessing = false;
          if (!isProcessing) {
            sharpenProgress =
                0.0; // Reset progress to zero if the process is stopped
          }
        }
      });
    });
  }

  void pauseSharpeningProcess() {
    setState(() {
      isProcessing = false;
    });
  }

  void stopSharpeningProcess() {
    setState(() {
      isProcessing = false;
      blurAmount = 10.0; // Reset blur amount
      sharpenProgress = 0.0; // Reset progress
      isLottieVisible = false; // Hide Lottie animation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          const Text('Welcome to the Home Page!'),
          const SizedBox(height: 20),
          Opacity(
            opacity:
                (1 - (blurAmount / 10)).clamp(0.0, 1.0), // Clamp opacity value
            child: Visibility(
              visible: isProcessing,
              child: Lottie.asset('assets/loading_lottie.json', height: 250),
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: !isProcessing ? startSharpeningProcess : () {},
                child: const Text('Start Sharpening'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: pauseSharpeningProcess,
                child: const Text('Pause Sharpening'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: stopSharpeningProcess,
                child: const Text('Stop Sharpening'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text('Progress: ${sharpenProgress.toStringAsFixed(1)}%'),
        ],
      ),
    );
  }
}
