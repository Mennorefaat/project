import 'dart:js';
import 'package:flutter/material.dart';
import 'package:untitled1/ui/Note/AccountScreens/noteLogin.dart';
class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
        /*Image.network('https://img.freepik.com/premium-vector/cute-hand-drawn-planner-journal-notepad-paper-sheet-sticky-note-vector-illustration_6997-3919.jpg',
        fit: BoxFit.cover,
        height: 800,
        width:400,),

         */
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[800],
            ),
            onPressed: () {
          login();
          }, child: const Text ('Start'),)
      ]
    ),
    );
  }

  void login() {

      Navigator.push(context as BuildContext , MaterialPageRoute(builder: (context)=> const NoteLogin()));

  }


}
