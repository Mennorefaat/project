
import 'package:flutter/material.dart';
import 'package:untitled1/ui/listView/Model/note.dart';

import '../../colors/colors.dart';


class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.title,  required this.content, required this.image, });

   final String title;
   final String content;
  final String image;
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
    imageController.text=widget.image;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: selectedColor,
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
                const SizedBox(height: 10,),
                Image.network(widget.image),
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
      String image =contentController.text;

      final note=Note(content, title,image);

      Navigator.pop(context,note);
      }


      }


