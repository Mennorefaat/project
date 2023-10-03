
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IncrementDecrementScreen(),
    );
  }
}
class IncrementDecrementScreen extends StatefulWidget {
  const IncrementDecrementScreen({super.key});

  @override
  State<IncrementDecrementScreen> createState() => _IncrementDecrementScreenState();
}

class _IncrementDecrementScreenState extends State<IncrementDecrementScreen> {
  int number=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("سبحة"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 66,
          ),

        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: (){
             number=0;
              setState(() {});
            },
            child: const Icon(Icons.undo),
          ),
          const SizedBox(height: 15,),
          FloatingActionButton(
            onPressed: (){
              number++;
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 15,),
          FloatingActionButton(
            onPressed: (){
              number--;
              setState(() {});
            },
            child: const Icon(Icons.remove),
          ),

        ],
      ),
    );
  }
}

