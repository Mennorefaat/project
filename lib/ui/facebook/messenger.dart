import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/ui/facebook/Models/storyModel.dart';

class MessengerPage extends StatefulWidget {
  const MessengerPage({super.key});

  @override
  State<MessengerPage> createState() => _MessengerPageState();
}

class _MessengerPageState extends State<MessengerPage> {

  List<StoryModel> story=[
   StoryModel( '11:41 PM',true,'https://img.freepik.com/premium-photo/cute-3d-cartoon-farm-girl-generative-ai_913665-1568.jpg', 'Mero', 'plz Send me ...',true),
    StoryModel('12:30 AM', false,'https://img.freepik.com/premium-photo/very-cute-kid-caracter-animation-pixar-style_950002-73325.jpg', 'Dalia', 'Typing...',false),
    StoryModel('01:02 PM',true, 'https://img.freepik.com/premium-photo/very-cute-kid-caracter-animation-pixar-style_950002-73666.jpg', 'Gigi', 'What about your day?',true),
    StoryModel( '2 Days Ago',false,'https://img.freepik.com/premium-photo/cute-3d-cartoon-farm-girl-generative-ai_913665-1568.jpg', 'Marnona', 'Send me ',false),
    StoryModel('Wednesday',true, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_BJQdD4ybTfV67ABVAwRhRd_o6TSM6wQYJgs7EbPqpUZ-0TU_V1GENzXZcTBkrSmufOc&usqp=CAU', 'Eman', 'Hello Menna',false),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: screenAppbar(),
      body:Column(
        children: [
           searchBar(),
          storyListView(),
          //online(),
          messages(),
        ],
      ) ,
    );
  }

 PreferredSizeWidget screenAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text('Chats',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30),),
      leadingWidth: 50,
      leading:  const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: CircleAvatar(
           //radius:20,
            backgroundImage: NetworkImage('https://img.freepik.com/premium-photo/cute-cartoon-little-girl-character-3d-rendered-generative-ai_913665-4621.jpg')),
      ),
      actions: [
        IconButton(onPressed: (){},
            icon: const Icon(Icons.camera_alt,color: Colors.black)),
        IconButton(onPressed: () {},
            icon: const Icon(Icons.edit,color: Colors.black,)),
      ],

    );
 }

 Widget storyListView() {
   return SizedBox(
     height: 100,
     child: ListView.builder(
         itemCount:story.length + 1,
         scrollDirection: Axis.horizontal,
         itemBuilder: (context,index){
           return index == 0 ?
           yourStory():Padding(
             padding: const EdgeInsets.symmetric(horizontal: 5),
             child: Column(
               children: [
                 Stack(
                   alignment: Alignment.center,
                   children: [
                     Visibility(
                       visible: !story [index-1].isOnline,
                       child: CircleAvatar(
                         radius: 34,
                         backgroundColor: Colors.transparent,
                         child: Container(
                           decoration: const BoxDecoration(
                             color: Colors.blue,
                             shape: BoxShape.circle,
                           ),

                         ),
                       ),
                     ),
                     const CircleAvatar(
                       radius: 32,
                       backgroundColor: Colors.white,
                     ),
                     CircleAvatar(
                       radius:  story[index -1].isOnline ? 34:30,
                       backgroundImage: NetworkImage(story[index -1].otherPic,) ,
                     ),
                   ],
                 ),

                 const SizedBox(height: 5,),
                 Text(story[index -1].profileName,style: const TextStyle(color: Colors.black),),
               ],
             ),
           );
         }
     ),
   );
 }

 Widget yourStory() {
   return const Padding(
     padding: EdgeInsets.symmetric(horizontal: 5),
     child: Column(
       children: [
         Stack(
           alignment: Alignment.bottomRight,
           children: [
             CircleAvatar(
               radius: 33,

               backgroundImage: NetworkImage('https://img.freepik.com/premium-photo/cute-cartoon-little-girl-character-3d-rendered-generative-ai_913665-4621.jpg'),
             ),
             CircleAvatar(
               radius: 13,
               backgroundColor: Colors.white,
             ),
             CircleAvatar(
               radius: 12,
               backgroundColor: Colors.black ,
               child: Icon(Icons.add,size: 15,color: Colors.white,),
             ),
           ],
         ),
         SizedBox(height: 5,),
         Text('Add story',style: TextStyle(color: Colors.black),),
       ],
     ),

   );
 }

 Widget messages() {
    return Expanded(
        child: ListView.builder(
        itemCount:story.length ,
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                      NetworkImage(story[index].otherPic),
                      radius: 25,
                    ),
                    Visibility(
                      visible: story[index].isOnline,
                      child: const CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.green,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            story[index].profileName,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                            ),
                          ),
                          //const SizedBox(width: 170,),
                          Text(
                            story[index].time,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            story[index].message,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          Visibility(
                            visible: story[index].isSeen,
                            child: const CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.blue,
                            ),
                          )



                        ],
                      ),

                    ],

                  ),
                ),

              ],
            ),
            const SizedBox(height: 10,),
          ],
        ),
      );
    }
        )
   );
 }

 Widget searchBar() {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: TextField(
          decoration: InputDecoration(
            filled:  true,
            fillColor: Colors.grey[250],
            hintText: 'Search',
            prefixIcon: const Icon(
              Icons.search,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),

          ),
        ),
      ),
    );
  }

}


