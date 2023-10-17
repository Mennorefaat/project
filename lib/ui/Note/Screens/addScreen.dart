import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' show AppBar, BuildContext, Colors, Column, EdgeInsets, ElevatedButton, Form, FormState, GlobalKey, InputDecoration, Navigator, OutlineInputBorder, Padding, Scaffold, SizedBox, State, StatefulWidget, Text, TextEditingController, TextFormField, TextInputAction, TextInputType, Widget;

import '../Model/note.dart';



class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final titleController=TextEditingController();
  final contentController=TextEditingController();
  final imageController=TextEditingController();
  final formKey= GlobalKey<FormState>();
  final firestore= FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[700],
      appBar: AppBar(
        title: const Text('Add info'),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key:  formKey,
          child: Column(
            children: [
              const SizedBox(height: 10,),
              TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('title'),
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return ' title required';
                  }
                  if (value!.length<3){
                    return ' very small';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                controller: contentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('content'),
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return ' content required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()=> addNewInfo(),
                    child: const Text('Add')),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void addNewInfo(){
    if(!formKey.currentState!.validate()){
      return;
    }
    String title =titleController.text;
    String content =contentController.text;
    String id =DateTime.now().millisecondsSinceEpoch.toString();
    final note=Note(content, title,id);

    firestore .collection('notes').doc(id).set(note.toMap());
    Navigator.pop(context,note);
  }


}
