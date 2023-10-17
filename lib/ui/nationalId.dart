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
String year ='';
String month = "";
String day = '';
String countryCode = '';
String gender = '';
String idNumber= '';

  @override
  void initState(){
    super.initState();
    titleController.text=widget.title;
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(

        appBar: AppBar(
          title: const Text('National Id',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
      children: [
          TextFormField(
            // 30114300103953
            validator: (value){
              if(value!.startsWith("2")){
             year = "19"+ value.substring(1,3);
              } else if(value!.startsWith("3")){
                year = "20"+ value.substring(1,3);
              } else{
                return "invalid id";
              }

            if(value!.length>12){
              month= value.substring(3,5);
            }else{
              return "invalid id";
            }

            },
            controller: titleController,
            decoration: InputDecoration(
              hintText: "national id"
            ),

      ),

        ElevatedButton(onPressed: (){
          if(formKey.currentState!.validate()){

          setState(() {
            print(year);
            print(month);
                        });
          }
        }, child: Text("text")),
        Text(year),
        Text(month),
      ],
      ),
        )

      ),
    );
  }

}
