import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/ui/Note/Screens/addScreen.dart';
import 'package:untitled1/ui/Note/Screens/editScreen.dart';

import '../Model/note.dart';



class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List<Note> myNotes=[

  ];
  //connect by firebase
  final firestore =FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotes();
  }
  void getNotes(){

    firestore.collection('notes').get().then((value)  {

      myNotes.clear();//to not repeat the info
     for (var document in value.docs) {
      final note =Note.fromMap(document.data());
      myNotes.add(note);
     }
     print(myNotes.toString());
     setState(() {});
    }).catchError((e){
    print(e);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
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
        color: Colors.brown[200],
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

          Padding(padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(child: ElevatedButton.icon(onPressed: (){
                  firestore.collection('notes')
                            .doc(myNotes[index].id)
                            .delete();
                  myNotes.removeAt(index);
                  setState(() {});
                },
                  icon:const Icon(Icons.delete),
                  label:const Text('Delete'),
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.red[400]),)),

                const SizedBox(width: 10,),
                Expanded(child: ElevatedButton.icon(
                  onPressed:()=>  editInfo( index),
                  icon:const Icon(Icons.edit),
                  label:const Text('Edit'),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                      backgroundColor: Colors.brown[300]),)),

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
    ).then((value) => getNotes() );
  }
  void addNewInfo(Note value){
    myNotes.add(value);
    setState(() {});
  }

  void editInfo( int index) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context)=>
          EditScreen(title: myNotes[ index].title,
            content: myNotes[ index].content,
            ),
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
