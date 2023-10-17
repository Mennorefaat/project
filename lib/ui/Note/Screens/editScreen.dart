import 'package:flutter/material.dart';

import '../Model/note.dart';


class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.title,  required this.content, });

  final String title;
  final String content;
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  final titleController=TextEditingController();
  final contentController=TextEditingController();
  final imageController=TextEditingController();
  final formKey= GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    titleController.text=widget.title;
    contentController.text=widget.content;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[700],
      appBar: AppBar(
        title: const Text('Edit info'),
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
                  label: Text('title',style: TextStyle(color: Colors.grey),),
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return ' title required';
                  }
                  if (value.length<3){
                    return ' very small';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: contentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('content',style: TextStyle(color: Colors.grey),),
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return 'content required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()=> updateInfo(),
                    child: const Text('update')),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void updateInfo(){
    if(!formKey.currentState!.validate()){
      return;
    }
    String title =titleController.text;
    String content =contentController.text;


    final note=Note(content, title,'id');

    Navigator.pop(context,note);
  }


}


