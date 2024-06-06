import 'package:flutter/material.dart';
import 'package:lesson_32/services/local_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final localDatabase = LocalDatabase();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    localDatabase.database;
  }

  void addNote() async {
    setState(() {
      isLoading = true;
    });
    await localDatabase.addNote("Ertaga mazza qilib dars qilishim kerak emas!");
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "Database",
          style: TextStyle(fontFamily: 'Lato'),
        ),
        actions: [
          IconButton(
            onPressed: addNote,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : const Text(
                "Add Notes",
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 20,
                ),
              ),
      ),
    );
  }
}
