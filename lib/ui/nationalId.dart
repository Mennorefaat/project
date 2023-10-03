import 'package:flutter/cupertino.dart';
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
      home: const NationalId(title: '',),
    );
  }
}
class NationalId extends StatefulWidget {
  const NationalId({super.key, required this.title});
  final String title;


  @override
  State<NationalId> createState() => NationalIdState();
}

class NationalIdState extends State<NationalId> {

  final titleController=TextEditingController();
  final formKey= GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    titleController.text=widget.title;
  }

  String nationalID = '';
  // String firstNumber = nationalID.substring(0, 1);
  // String secondNumber = nationalID.substring(1, 3);
  // String thirdNumber = nationalID.substring(2, 3);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('National Id',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context,index){
          return buildNoteItem(index);
        },
      ),
    );
  }
  Widget buildNoteItem(int index){
      return Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            // comment
            children: [
              TextFormField(
                controller: titleController,
                validator: (value){
                  if (value!.isEmpty){
                    return ' title required';
                  }
                  if (value!.length<14){
                    return ' very small';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
               decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('title',style: TextStyle(color: Colors.blue),),
                ),
               ),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
                    onPressed: () =>  analysis(),
                    child: const Text('Analysis')),
              ),

            ],
          ),
        ),

    );
  }

  void analysis() {
    if(!formKey.currentState!.validate()){
      return;
    }
    String title =titleController.text;

    Navigator.pop(context,title);
  }
}
