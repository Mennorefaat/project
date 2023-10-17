
import 'package:flutter/material.dart';
import 'package:untitled1/ui/Insta/Models/modelPosts.dart';
import 'package:untitled1/ui/Insta/story_view_screen.dart';

import 'Models/modelStories.dart';
import 'insta_home_screen.dart';

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
      home: const InstaMainScreen(),
    );
  }
}
class InstaMainScreen extends StatefulWidget {
  const InstaMainScreen({super.key});

  @override
  State<InstaMainScreen> createState() => _InstaMainScreenState();
}

class _InstaMainScreenState extends State<InstaMainScreen> {

  List<ModelStories> stories=[
    ModelStories( 'Sozy_11',  'https://img.freepik.com/premium-photo/cute-3d-cartoon-farm-girl-generative-ai_913665-1568.jpg', true),
    ModelStories('Mervat_m', 'https://img.freepik.com/premium-photo/cute-cartoon-little-girl-character-3d-rendered-generative-ai_913665-4621.jpg',false),
    ModelStories('Lila_li', 'https://img.freepik.com/premium-photo/very-cute-kid-caracter-animation-pixar-style_950002-73325.jpg', true),
    ModelStories('Sara_ss', 'https://img.freepik.com/premium-photo/very-cute-kid-caracter-animation-pixar-style_950002-73666.jpg', true),
    ModelStories('Youmna',    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_BJQdD4ybTfV67ABVAwRhRd_o6TSM6wQYJgs7EbPqpUZ-0TU_V1GENzXZcTBkrSmufOc&usqp=CAU', false),
    ModelStories('Girl_M', 'https://img.freepik.com/premium-photo/cute-3d-cartoon-farm-girl-generative-ai_913665-1568.jpg', false),

  ];
  List<ModelPosts> posts=[
    ModelPosts('Mervat_m', 'https://img.freepik.com/premium-photo/cute-cartoon-little-girl-character-3d-rendered-generative-ai_913665-4621.jpg',
        'Lila_li','https://img.freepik.com/premium-photo/very-cute-kid-caracter-animation-pixar-style_950002-73325.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_BJQdD4ybTfV67ABVAwRhRd_o6TSM6wQYJgs7EbPqpUZ-0TU_V1GENzXZcTBkrSmufOc&usqp=CAU',
      'https://img.freepik.com/premium-photo/cute-3d-cartoon-farm-girl-generative-ai_913665-1568.jpg',
      'https://www.thewowstyle.com/wp-content/uploads/2015/03/interior-design-photohouse-design-interior-decorating-ideas-qt6rqt58-Good-looking-Decoration-Inspiration-Good-looking-prom-decor-ideas-Industrial-Style.jpg',
    ),
    ModelPosts('Sozy_11', 'https://img.freepik.com/premium-photo/cute-3d-cartoon-farm-girl-generative-ai_913665-1568.jpg',
        'Sara_ss', 'https://img.freepik.com/premium-photo/very-cute-kid-caracter-animation-pixar-style_950002-73666.jpg',
        'https://img.freepik.com/premium-photo/cute-3d-cartoon-farm-girl-generative-ai_913665-1568.jpg',
        'https://img.freepik.com/premium-photo/very-cute-kid-caracter-animation-pixar-style_950002-73325.jpg',
        'https://damassets.autodesk.net/content/dam/autodesk/www/industry/3d-animation/create-beautiful-3d-animations-thumb-1204x677.jpg'),
  ];
  final imageUrl='https://img.freepik.com/premium-photo/3d-character-girl_416902-3051.jpg?w=360';
  int currentIndex=0;

  //final titles=['Home','Search','Add','Videos','Profile'];
  final List <Widget> screens=[
    const InstaHomeScreen(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: screenAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (value){
          currentIndex=value;
          setState(() {
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: '',
          ),
        ],
      ),
     // body: screens[currentIndex],
      body: Column(
        children: [
          storyListView(),
          postsListView(),
        ],
      ),
    );
  }
  PreferredSizeWidget screenAppBar(){
    return AppBar(
      elevation: 0,
      toolbarHeight: 100,
      backgroundColor: Colors.white,
      //title: Text(titles[currentIndex],
      title: const Text('𝓘𝓷𝓼𝓽𝓪𝓰𝓻𝓪𝓶',
        style: TextStyle(color: Colors.black,fontSize: 40),),
      actions: [
        IconButton(onPressed: (){},
            icon: const Icon(Icons.favorite_border_outlined,color: Colors.black,)),
        IconButton(onPressed: (){},
            icon: const Icon(Icons.chat_outlined,color: Colors.black,)),

      ],
    );
  }

 Widget storyListView() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount:stories.length + 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return index == 0 ? 
            yourStory():InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const StoryViewScreen())),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Visibility(
                          visible: !stories [index-1].shown,
                          child: CircleAvatar(
                            radius: 36,
                            backgroundColor: Colors.transparent,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0XFFf9ce34),
                                      Color(0XFFf9ce34),
                                      Color(0XFFee2a7b),
                                      Color(0XFF6228d7),
                                      ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,),

                              ),

                            ),
                          ),
                        ),
                        const CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                        ),
                        CircleAvatar(
                          radius: stories[index -1].shown ? 36:30,
                          backgroundImage: NetworkImage(stories[index -1].image,) ,
                        ),
                      ],
                    ),

                    const SizedBox(height: 5,),
                     Text(stories[index -1].name,style: const TextStyle(color: Colors.black),),
                  ],
                ),
              ),
            );
          }
      ),
    );
 }
 Widget yourStory(){
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 35,

                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      const CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.white,
                      ),
                      const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blue ,
                        child: Icon(Icons.add,size: 15,),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text('Your story',style: TextStyle(color: Colors.black),),
                ],
              ),

    );
 }

 Widget postsListView() {
    
    return Expanded(
      child: ListView.builder(
        itemCount: posts.length,
          itemBuilder: (context,index){
       return Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               children: [
                 CircleAvatar(
                   radius: 20,
                   backgroundImage: NetworkImage(posts[index].image1 ,
                 ),),
                 const SizedBox(width: 10,),
                 Expanded(child: Text(posts[index].name1,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))
               ,const Icon(Icons.more_horiz_outlined,color: Colors.black,),
               ],
             ),
           ),
               Image.network(posts[index].image5,
               height: 300,
                 width: double.infinity,
                 fit: BoxFit.fitWidth,),
            Row(
              children: [
                IconButton(onPressed: (){},
                    icon: const Icon(Icons.favorite_border_outlined,color: Colors.black,)),
                IconButton(onPressed: (){},
                    icon: const Icon(Icons.comment_outlined,color: Colors.black,)),
                IconButton(onPressed: (){},
                    icon: const Icon(Icons.send,color: Colors.black,)),
                const Spacer(),
                IconButton(onPressed: (){},
                    icon: const Icon(Icons.bookmark_border_outlined,color: Colors.black,)),

              ],
            ),
           /* Row(
                   children: [

                     Stack(
                       alignment: AlignmentDirectional.centerEnd,
                       children: [
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
                             child: Stack(
                               alignment: AlignmentDirectional.center,
                               children: [
                                 CircleAvatar(
                                   radius: 18,
                                   backgroundColor: Colors.white,
                                 ),
                                 CircleAvatar(
                                   radius: 17,
                                   backgroundImage: NetworkImage(posts[index].image2) ,
                                 ),
                               ],
                             ),
                           ),


                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Stack(
                             alignment: AlignmentDirectional.center,
                             children: [
                               CircleAvatar(
                                 radius: 18,
                               backgroundColor: Colors.white,
                               ),
                               CircleAvatar(
                                 radius: 17,
                                 backgroundImage: NetworkImage(posts[index].image3) ,
                               ),
                             ],
                           ),
                         ),

                         Stack(
                           alignment: AlignmentDirectional.center,
                           children: [
                             CircleAvatar(
                               radius: 18,
                               backgroundColor: Colors.white,
                             ),
                             CircleAvatar(
                               radius: 17,
                               backgroundImage: NetworkImage(posts[index].image4) ,
                             ),
                           ],
                         ),

                       ],
                     ),

                     RichText(
                       text: TextSpan(
                         text: ' Liked by ',
                         style: DefaultTextStyle.of(context).style,
                         children:  <TextSpan>[
                           TextSpan(text: posts[index].name2, style: const TextStyle(fontWeight: FontWeight.bold)),
                           const TextSpan(text: ' and'),
                           const TextSpan(text: ' others', style: TextStyle(fontWeight: FontWeight.bold)),

                         ],
                       ),
                     )
                   ],
                 ),

*/
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8.0),
             child: Row(
               children: [
                 Row(
                   children: [
                     Align(
                       widthFactor: .7,
                       child: CircleAvatar(
                         backgroundColor: Colors.white,
                         radius: 18,
                         child: CircleAvatar(
                           radius: 16,
                           backgroundImage:
                           NetworkImage(posts[index].image2) ,
                         ),
                       ),
                     ),
                     Align(
                       widthFactor: .7,
                       child: CircleAvatar(
                         backgroundColor: Colors.white,
                         radius: 18,
                         child: CircleAvatar(
                           radius: 16,
                           backgroundImage:
                           NetworkImage(posts[index].image4) ,
                         ),
                       ),
                     ),
                     Align(
                       widthFactor: .7,
                       child: CircleAvatar(
                         backgroundColor: Colors.white,
                         radius: 18,
                         child: CircleAvatar(
                           radius: 16,
                           backgroundImage:
                           NetworkImage(posts[index].image3) ,
                         ),
                       ),
                     ),
                     const SizedBox(width: 20,),
                     RichText(
                       text: TextSpan(
                         text: ' Liked by ',
                         style: DefaultTextStyle.of(context).style,
                         children:  <TextSpan>[
                           TextSpan(text: posts[index].name2, style: const TextStyle(fontWeight: FontWeight.bold)),
                           const TextSpan(text: ' and'),
                           const TextSpan(text: ' others', style: TextStyle(fontWeight: FontWeight.bold)),

                         ],
                       ),
                     )
                   ],
                 ),
               ],
             ),
           )
         ],
       );
      }),
    );
 }
}

