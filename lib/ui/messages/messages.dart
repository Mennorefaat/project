import 'package:flutter/material.dart';
import 'package:untitled1/ui/messages/model.dart';

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
      home: const Messages(),
    );
  }
}
class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  List<Photos> photos=[
    Photos( 'https://img.freepik.com/premium-photo/cute-cartoon-little-girl-character-3d-rendered-generative-ai_913665-4621.jpg',
  ),
    Photos('https://img.freepik.com/premium-photo/very-cute-kid-caracter-animation-pixar-style_950002-73325.jpg',
    ),
    Photos('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_BJQdD4ybTfV67ABVAwRhRd_o6TSM6wQYJgs7EbPqpUZ-0TU_V1GENzXZcTBkrSmufOc&usqp=CAU',
    ),
    Photos('https://img.freepik.com/premium-photo/cute-3d-cartoon-farm-girl-generative-ai_913665-1568.jpg',
    ),
    Photos( 'https://www.thewowstyle.com/wp-content/uploads/2015/03/interior-design-photohouse-design-interior-decorating-ideas-qt6rqt58-Good-looking-Decoration-Inspiration-Good-looking-prom-decor-ideas-Industrial-Style.jpg',
    ),
    Photos( 'https://img.freepik.com/premium-photo/cute-cartoon-little-girl-character-3d-rendered-generative-ai_913665-4621.jpg',
    ),
  ];

  List<String> names=['Laurent',
    'Tracy',
    'Claire',
    'Joe',
    'Mark',
    'Williams',];
  List<String> time=['20:18',
    '19:22',
    '14:34',
    '11:05',
    '09:46',
    '08:15',];
  List<String> messages=['How about meeting tomorrow?',
    'I love that idea,it’s great!',
    'I wasn’t aware of that. \nLet me check',
    'Flutter just release 1.0 officially. \nShould i go for it?',
    'It totally makes sense to get some \nextra day-off.',
    'It has been re-scheduled to next \nSaturday 7:30pm',];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        toolbarHeight: 70,
        title: const Text('Messages'),
        centerTitle: true,
      ),
      body:ListView.builder(
        itemCount: names.length,
        itemBuilder: (context,index){
          return buildNoteItem(index);
        },
      ),
    );
  }
  Widget buildNoteItem(int index){
    return Container(
      padding: const EdgeInsets.all(10),

      child: Column(
        children: [
          Row(
            children: [
               CircleAvatar(
              backgroundImage:
              NetworkImage(photos[index].image),
              radius: 30,
            ),
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(

                    children: [
                      Text(
                        names[index],
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Text(
                        time[index],
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    messages[index],
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                alignment: Alignment.topRight,
                onPressed:(){}, icon:  const Icon(Icons.arrow_forward_ios,size: 20,color: Colors.grey,),)
              ,
            ],
              ),
            const SizedBox(height: 10,),
            Divider(
            color: Colors.grey[300],
            thickness: 1.0,


      ),
        ],
      ),


    );
  }
}
