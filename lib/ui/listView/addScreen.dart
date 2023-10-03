import 'package:flutter/material.dart' show AppBar, BuildContext, Column, EdgeInsets, ElevatedButton, Form, FormState, GlobalKey, InputDecoration, Navigator, OutlineInputBorder, Padding, Scaffold, SizedBox, State, StatefulWidget, Text, TextEditingController, TextFormField, Widget;

import '../../colors/colors.dart';
import 'Model/note.dart';


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: selectedColor,
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
                TextFormField(
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
                TextFormField(
                  controller: imageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('image'),
                  ),
                  validator: (value){
                    if (value!.isEmpty){
                      return ' image required';
                    }
                    return null;
                  },
                ),

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
        String image =imageController.text;

        final note=Note(content, title,image);

        Navigator.pop(context,note);
        }


  }
