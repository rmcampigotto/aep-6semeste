// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authenticator',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
        ),
      ),
      home: const TokenGeneratorPage(),
    );
  }
}

class TokenGeneratorPage extends StatefulWidget {
  const TokenGeneratorPage({super.key});

  @override
  _TokenGeneratorPageState createState() => _TokenGeneratorPageState();
}

class _TokenGeneratorPageState extends State<TokenGeneratorPage> {
  List<String> tokens = [];
  List<int> countdowns = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    generateNewToken(); 
    startTokenGenerator();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTokenGenerator() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      for (int i = 0; i < countdowns.length; i++) {
        if (countdowns[i] > 0) {
          setState(() {
            countdowns[i]--;
          });
        } else {
          setState(() {
            tokens[i] = generateRandomToken(); 
            countdowns[i] = 40; 
          });
        }
      }
    });
  }

  String generateRandomToken() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    final tokenPattern = List.generate(6, (index) {
      return characters[random.nextInt(characters.length)];
    }).join();
    
    return '${tokenPattern.substring(0, 3)}-${tokenPattern.substring(3)}';
  }

  void generateNewToken() {
    setState(() {
      String newToken = generateRandomToken(); 
      tokens.add(newToken); 
      countdowns.add(40); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Authenticator',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tokens.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    color: Colors.grey[800],
                    child: ListTile(
                      title: Center(
                        child: Column(
                          children: [
                            Text(
                              'Token ${index + 1}: ${tokens[index]}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            CircularPercentIndicator(
                              radius: 50.0,
                              lineWidth: 8.0,
                              animation: true,
                              percent: countdowns[index] / 40,
                              center: Text(
                                '${countdowns[index]}s',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: Colors.grey[700]!,
                              progressColor: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: generateNewToken,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Adicionar Novo Token'),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularPercentIndicator extends StatelessWidget {
  final double radius;
  final double lineWidth;
  final bool animation;
  final double percent;
  final Widget center;
  final Color backgroundColor;
  final Color progressColor;

  const CircularPercentIndicator({
    super.key,
    required this.radius,
    required this.lineWidth,
    required this.animation,
    required this.percent,
    required this.center,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: radius,
          height: radius,
          child: CircularProgressIndicator(
            value: percent,
            backgroundColor: backgroundColor,
            color: progressColor,
            strokeWidth: lineWidth,
          ),
        ),
        center,
      ],
    );
  }
}
