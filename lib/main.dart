import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Bmi());
  }
}

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  double result = 0.0;
  String operation = '';

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: const Icon(Icons.calculate, color: Colors.white),
        backgroundColor: const Color(0xFF16213E),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0F3460), Color(0xFF533483)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.calculate_rounded,
                      color: Colors.white70,
                      size: 40,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Calculator",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _controller1, // ✅ controller added
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withValues(
                          alpha: 0.1,
                        ), // fixed
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color(0xFFE94560),
                            width: 2,
                          ),
                        ),
                        labelText: "First Number",
                        labelStyle: const TextStyle(color: Colors.white60),
                        hintText: 'Enter first number',
                        hintStyle: const TextStyle(color: Colors.white38),
                        prefixIcon: const Icon(
                          Icons.looks_one_rounded,
                          color: Color(0xFFE94560),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _controller2, // controller added
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withValues(
                          alpha: 0.1,
                        ), // fixed
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Color(0xFFE94560),
                            width: 2,
                          ),
                        ),
                        labelText: "Second Number",
                        labelStyle: const TextStyle(color: Colors.white60),
                        hintText: 'Enter second number',
                        hintStyle: const TextStyle(color: Colors.white38),
                        prefixIcon: const Icon(
                          Icons.looks_two_rounded,
                          color: Color(0xFFE94560),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          heroTag: 'add',
                          backgroundColor: Colors.white.withValues(alpha: 0.1),
                          onPressed: () {
                            setState(() {
                              final number1 =
                                  double.tryParse(_controller1.text) ?? 0;
                              final number2 =
                                  double.tryParse(_controller2.text) ?? 0;
                              result = number1 + number2;
                              operation = '+';
                            });
                          },
                          child: const Icon(Icons.add, color: Colors.redAccent),
                        ),
                        const SizedBox(width: 10),
                        FloatingActionButton(
                          heroTag: 'subtract',
                          backgroundColor: Colors.white.withValues(alpha: 0.1),
                          onPressed: () {
                            setState(() {
                              final number1 =
                                  double.tryParse(_controller1.text) ?? 0;
                              final number2 =
                                  double.tryParse(_controller2.text) ?? 0;
                              result = number1 - number2;
                              operation = '-';
                            });
                          },
                          child: const Icon(
                            Icons.remove,
                            color: Colors.redAccent,
                          ),
                        ),
                        SizedBox(width: 10),
                        FloatingActionButton(
                          heroTag: 'multiply',
                          backgroundColor: Colors.white.withValues(alpha: 0.1),
                          onPressed: () {
                            setState(() {
                              final number1 =
                                  double.tryParse(_controller1.text) ?? 0;
                              final number2 =
                                  double.tryParse(_controller2.text) ?? 0;
                              result = number1 * number2;
                              operation = '*';
                            });
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.redAccent,
                          ),
                        ),
                        SizedBox(width: 10),
                        FloatingActionButton(
                          heroTag: 'subtract',
                          backgroundColor: Colors.white.withValues(alpha: 0.1),
                          onPressed: () {
                            setState(() {
                              final number1 =
                                  double.tryParse(_controller1.text) ?? 0;
                              final number2 =
                                  double.tryParse(_controller2.text) ?? 0;
                              if (number2 == 0) {
                                print("Invalid");
                              } else {
                                result = number1 / number2;
                                operation = '/';
                              }
                            });
                          },
                          child: const Icon(
                            Icons.percent,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Result: $result',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
