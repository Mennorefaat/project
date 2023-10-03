import 'package:flutter/material.dart';
import 'package:untitled1/colors/colors.dart';

import 'Model/note.dart';
import 'addScreen.dart';
import 'editScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,

      ),
      home: const ListDays(),
    );
  }
}
class ListDays extends StatefulWidget {
  const ListDays({super.key});

  @override
  State<ListDays> createState() => _ListDaysState();
}

class _ListDaysState extends State<ListDays> {

      List<Note> myNotes=[
        Note('4th year in collage', 'Menna','https://tse3.mm.bing.net/th?id=OIP.Vt3kGu4X6WQlmH91GpJpzgHaFH&pid=Api&P=0&h=180'),
        Note('3rd year in collage', 'Shahd','https://tse1.mm.bing.net/th?id=OIP.E4IJcali_762Oo_vNhhbFgHaEK&pid=Api&P=0&h=180'),

      ];

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: selectedColor,
      appBar: AppBar(
        title: const Text('info'),
        centerTitle: true,

      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>addInfo()
      ,
      child: const Icon(Icons.add),),
      body: ListView.builder(
        itemCount: myNotes.length,
        itemBuilder: (context,index){

          return buildNoteItem(index);
        },
      ),
    );
  }
      Widget buildNoteItem(int index){
        return Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: const EdgeInsets.all(10),
                child: Text(
                  myNotes[index].title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey
                  ),
                ),),
              Padding(padding: const EdgeInsets.all(10),
                child: Text(
                  myNotes[index].content,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey
                  ),
                ),),
              Image.network(myNotes[index] .image,
              fit: BoxFit.cover,),
              Padding(padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(child: ElevatedButton.icon(onPressed: (){
                      myNotes.removeAt(index);
                      setState(() {

                      });
                    },
                      icon:const Icon(Icons.delete),
                      label:const Text('Delete'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),)),

                    const SizedBox(width: 10,),
                    Expanded(child: ElevatedButton.icon(
                  onPressed:()=>  editInfo( index),
                      icon:const Icon(Icons.edit),
                      label:const Text('Edit'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),)),

                  ],
                ),)
            ],
          ),
        );
      }
 void addInfo(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>  const AddScreen(),
        ),
    ).then((value) => addNewInfo(value));
 }
 void addNewInfo(value){
        myNotes.add(value);
         setState(() {

         });
      }

  void editInfo( int index) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>
            EditScreen(title: myNotes[ index].title,
              content: myNotes[ index].content,
              image: myNotes[ index].image,),
        ),
    ).then((value) => updateInfo(index,value))
    ;
  }

 void updateInfo(int index,Note value) {
   myNotes[index]=value;
   setState(() {

   });

 }
}



