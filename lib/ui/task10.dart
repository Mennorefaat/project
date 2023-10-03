import 'package:flutter/material.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const SignIn(),
    );
  }
}
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obscureText=true;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
       backgroundColor: Colors.deepOrangeAccent,
        body: Column(
                 mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIvKI9ViZBSOhZbEXwz3jvO6O94rrfy8bAng&usqp=CAU',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,

                          ),
                          const SizedBox(height: 10),
                          const Text('Welcome ',style: TextStyle(fontSize: 20),),
                          const Text('Sign In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),

                        ],
                      ),
                    ),



                    Expanded(
                  child: Container(

                       padding: const EdgeInsets.all(20.0),
                        decoration:const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.elliptical(30, 40),topRight: Radius.elliptical(30, 40),),
                        color: Colors.white,
                                 ),


                   child:Column(
                     mainAxisSize: MainAxisSize.max,
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.center,

                     children: [

                       const SizedBox(height: 15,),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text('Email',style: TextStyle(fontSize: 15),),


                      ),

                      TextFormField(
                       textInputAction: TextInputAction.next,
                       keyboardType: TextInputType.emailAddress,
                       decoration: const InputDecoration(
                         //labelText: 'Email',
                         suffixIcon:  Icon(Icons.check,color: Colors.green,),
                       ),
                       ),
                      const SizedBox(height: 10),
                       const Align(
                         alignment: Alignment.topLeft,
                         child: Text('Password',style: TextStyle(fontSize: 15),),


                       ),
                      TextFormField(
                        obscureText:obscureText ,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,

                        style: const TextStyle(
                          color: Colors.black,),
                        decoration:  InputDecoration(
                          //labelText: 'Password',

                          suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  obscureText=!obscureText;
                                });
                              }
                              , icon:Icon(obscureText? Icons.visibility_off:Icons.visibility)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: (){},
                        child:const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Forget Password?' ,style: TextStyle(color: Colors.black,),),

                        ),

                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height:60,
                        child: ElevatedButton(
                          onPressed: () {  },
                          child: const Text ('Sign In'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [

                         const Text('Don`t have an account?') ,
                         const SizedBox(width: 5,),
                         TextButton(onPressed: ()=> navToSignUp(context),
                           child:const Text('Sign Up'),
                         ),

                   ],
               ),
                    ],
          ),
                  ),
                ),
            ],
           ),

      ),
    );
  }
}
navToSignUp(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const SignUp()),
  );
}
class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.deepOrangeAccent,
      body: Column(

         mainAxisSize: MainAxisSize.min,
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         crossAxisAlignment: CrossAxisAlignment.start,


         children: [
       Container(
         padding: const EdgeInsets.all(30),
         child: const Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [

             SizedBox(height: 10),
             Text('Welcome ',style: TextStyle(fontSize: 20),),
             Text('Sign In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
           ],
         ),
       ),






           Expanded(
       child: Container(
         padding: const EdgeInsets.all(10),

       decoration:const BoxDecoration(
       borderRadius: BorderRadius.only(topLeft: Radius.elliptical(30, 40),topRight: Radius.elliptical(30, 40),),
       color: Colors.white,
       ),


        child: Column(

         mainAxisSize: MainAxisSize.max,
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           const SizedBox(height: 10),
           const Align(
             alignment: Alignment.topLeft,
             child: Text('Email',style: TextStyle(fontSize: 15),),


           ),
           TextFormField(
             textInputAction: TextInputAction.next,
             keyboardType: TextInputType.emailAddress,
             decoration:const InputDecoration(

               suffixIcon:  Icon(Icons.check,color: Colors.green,),
             ),
           ),
           const SizedBox(height: 10),
           const Align(
             alignment: Alignment.topLeft,
             child: Text('Number',style: TextStyle(fontSize: 15),),


           ),
           TextFormField(
             textInputAction: TextInputAction.next,
             keyboardType: TextInputType.number,
             decoration:  const InputDecoration(

               suffixIcon:  Icon(Icons.check,color: Colors.green,),
             ),
           ),

           const SizedBox(height: 10),
           const Align(
             alignment: Alignment.topLeft,
             child: Text('Number',style: TextStyle(fontSize: 15),),


           ),
           TextFormField(
             textInputAction: TextInputAction.next,
             keyboardType: TextInputType.number,
             decoration:  const InputDecoration(

               suffixIcon:  Icon(Icons.check,color: Colors.green,),
             ),
           ),
           const SizedBox(height: 10),
           SizedBox(
             width: double.infinity,
             height:60,
             child: ElevatedButton(
               onPressed: () {  },
               child: const Text ('Sign Up'),
             ),
           ),



           Row(
               mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,

               children: [
                 const SizedBox(height:30),

                 Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrTQRDtuPvHFM0nIgx47PGYcX0V9-GQ_xnAg&usqp',
                   width: 30,
                   height: 30,
                   fit: BoxFit.cover,
                 ),

                 const SizedBox(width: 30),
                 const Icon(Icons.camera,),
                 const SizedBox(width: 30),
                 Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqE2lJeOs_d29vBFPQnl_fInIHaHLeg0-qqw&usqp=CAU',
                   width: 30,
                   height: 30,
                   fit: BoxFit.cover,
                 ),

               ],),
         ]
       ) ,        ),
           ),
     ]
      ),
);
  }
}

