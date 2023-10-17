import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/ui/facebook/loginpage.dart';
import 'package:untitled1/ui/facebook/messenger.dart';

import 'Models/postModel.dart';

class FacebookPage extends StatefulWidget {
  const FacebookPage({super.key});

  @override
  State<FacebookPage> createState() => _FacebookPageState();
}

class _FacebookPageState extends State<FacebookPage> {
  List<PostModel> post = [
    PostModel(
        profilePic:
            'https://img.freepik.com/premium-photo/cute-3d-cartoon-farm-girl-generative-ai_913665-1568.jpg',
        postPic:
            'https://www.waldenu.edu/media/5423/seo-2220-bs-types-of-self-care-types-of-s-421481582-1200x675',
        name: 'Menna Refaat',
        captions: '><', isOnline: true),
    PostModel(
        profilePic:
            'https://img.freepik.com/premium-photo/cute-cartoon-little-girl-character-3d-rendered-generative-ai_913665-4621.jpg',
        postPic:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYUoPQAy5dlAHfTaRmfwffPey1183rA4GaNg&usqp=CAU',
        name: 'Mero',
        captions: 'Yourself First', isOnline: false),
    PostModel(
        profilePic:
            'https://img.freepik.com/premium-photo/very-cute-kid-caracter-animation-pixar-style_950002-73325.jpg',
        postPic:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGXzaE9wkWzjfAJAp0BuTnhjNSyJG8uYUKsQ&usqp=CAU',
        name: 'Dalia',
        captions: 'Toolkit', isOnline: true),
    PostModel(
        profilePic:
            'https://img.freepik.com/premium-photo/very-cute-kid-caracter-animation-pixar-style_950002-73666.jpg',
        postPic:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxqh8MY9o_OLc3YGOJBDcOsj1f-L7iU3Qz5A&usqp=CAU',
        name: 'Gigi',
        captions: ':)', isOnline: true),
    PostModel(
        profilePic:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_BJQdD4ybTfV67ABVAwRhRd_o6TSM6wQYJgs7EbPqpUZ-0TU_V1GENzXZcTBkrSmufOc&usqp=CAU',
        postPic:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6okT-l1uPifV9_3xb0Yj6UmWeqwjQtX2QTg&usqp=CAU',
        name: 'Eman Mohamed',
        captions: 'Self Care', isOnline: false),
    PostModel(
        profilePic:
            'https://img.freepik.com/premium-photo/cute-3d-cartoon-farm-girl-generative-ai_913665-1568.jpg',
        postPic:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO_tbMLWNmTrRSQQVrsg-7vxY0ZXTtCjERCA&usqp=CAU',
        name: 'Marnona',
        captions: 'List', isOnline: false),
    PostModel(
        profilePic:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSETio00gO_oIvQq8uR5oe3MrzE5KfTF5FIMmZ0wYTKWKjrFRuCoPMFzfE8KW7Z2KA-BxI&usqp=CAU',
        postPic:
        'https://media.altreeq.com/img/23/05/28/411898_W.jpg',
        name: 'Youssef Mohamed',
        captions: 'انا بيكوا فارد السيطرة', isOnline: true),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 30,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[900],
            elevation: 0,
            title: const Text(
              'facebook',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
            leadingWidth: 50,
            leading: const CircleAvatar(
                //radius: 5,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9N52KL6wvurBjc6rwyZqW-kfwKWyiGSeyBUeSJqYiUSV8Wgqc_YggjHSHrf_MzzVX_8Q&usqp=CAU')),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () => messengerPage(),
                  icon: const Icon(
                    Icons.chat_outlined,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {
                    // delete current user data
                    FirebaseAuth.instance.signOut();

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  icon: const Icon(
                    Icons.output_outlined,
                    color: Colors.white,
                  )),
            ],
            //automaticallyImplyLeading: false,
            bottom: const TabBar(
              indicatorColor: Colors.blue,
              tabs: [
                Tab(icon: Icon(Icons.home_filled)),
                Tab(icon: Icon(Icons.people_alt)),
                Tab(icon: Icon(Icons.add_alert_outlined)),
                Tab(
                  icon: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      'https://img.freepik.com/premium-photo/cute-cartoon-little-girl-character-3d-rendered-generative-ai_913665-4621.jpg',
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            color: Colors.black87,
            child: Column(
              children: [
                writePost(),
                facebookScroll(),
              ],
            ),
          )),
    );
  }

  Widget writePost() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(
              'https://img.freepik.com/premium-photo/cute-cartoon-little-girl-character-3d-rendered-generative-ai_913665-4621.jpg',
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[900],
                  hintText: 'what‘s in your mind',
                  hintStyle: const TextStyle(color: Colors.white, fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.book_outlined,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget facebookScroll() {
    return Expanded(
      child: ListView.separated(
        itemCount: post.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage: NetworkImage(
                                      post[index].profilePic,
                                    ),
                                  ),
                                  Visibility(
                                    visible: post[index].isOnline,
                                    child: const CircleAvatar(
                                      radius: 9,
                                      backgroundColor: Colors.green,
                                    ),
                                  )],
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post[index].name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  '11 hr ago',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.more_horiz_outlined,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        post[index].captions,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Image.network(
                  post[index].postPic,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Like',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.comment,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Comment',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Share',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.black87,
            thickness: 6,
          );
        },
      ),
    );
  }

  void messengerPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MessengerPage()),
    );
  }
}
