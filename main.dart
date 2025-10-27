import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String message = ""; // hiển thị kết quả

  Future<String> errorD() async {
    await Future.delayed(const Duration(seconds: 1));
    throw Exception("Fake error!"); // demo lỗi
  }

  Future<String> getUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return "User: Nam";
  }

  Future<String> getAge() async {
    await Future.delayed(const Duration(seconds: 2));
    return "Age : 36";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Future Demo")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    await errorD();
                    setState(() => message = "Thành công!");
                  } catch (e) {
                    setState(() => message = "Lỗi: $e");
                  }
                },
                child: const Text("Demo try-catch"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  var results = await Future.wait([getUser(), getAge()]);
                  setState(() => message = results.join(" | "));
                },
                child: const Text("Demo Future.wait()"),
              ),
              const SizedBox(height: 40),
              Text(message, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
