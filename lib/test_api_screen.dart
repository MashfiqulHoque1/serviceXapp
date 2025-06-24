import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestApiScreen extends StatefulWidget {
  const TestApiScreen({super.key});

  @override
  State<TestApiScreen> createState() => _TestApiScreenState();
}

class _TestApiScreenState extends State<TestApiScreen> {
  String log = "Loading...";

  Future<void> fetchData() async {
    try {
      final url = Uri.parse("https://prohandy.xgenious.com/api/v1/categories");
      final response = await http.get(url);
      final decoded = json.decode(response.body);

      // PRINT RAW RESPONSE + KEYS
      print("Raw Response Body: ${response.body}");
      print("Top-level keys: ${decoded.keys}");

      setState(() {
        if (decoded['data'] != null) {
          log = "Found 'data' with ${decoded['data'].length} items";
        } else if (decoded['categories'] != null) {
          log = "Found 'categories' with ${decoded['categories'].length} items";
        } else {
          log = "Unknown format. Keys: ${decoded.keys.join(', ')}";
        }
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        log = "Error: $e";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test API Screen")),
      body: Center(child: Text(log, style: const TextStyle(fontSize: 18))),
    );
  }
}
