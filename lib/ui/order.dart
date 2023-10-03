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
      ),
      home: const Order(),
    );
  }
}

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int number=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: const Icon(Icons.arrow_back_ios,color: Colors.black,),
        actions: const [
          Icon(Icons.more_vert,color: Colors.black,),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/image/salad.jpg',
            width:double.infinity,
              height: 300,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Expanded(
                 flex: 7,
                    child: Text('Greek Salad',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
                Expanded(

                  child: FloatingActionButton(onPressed: (){
                   number++;
                    setState(() {

                    });},
                  backgroundColor: Colors.black,

                      child: const Icon(Icons.add,color: Colors.white,size: 15),),
                ),
                 const SizedBox(width: 20,),
                 Expanded(
                   child: Text(
                       number.toString(),
                     style: const TextStyle(fontSize:20),

                ),
                 ),
               Expanded(
                 child: FloatingActionButton(onPressed: (){
                   if (number==0){
                     return;
                   }
                   number--;
                   setState(() {});
                 },
                     backgroundColor: Colors.black,
                   child: const Icon(Icons.remove,color: Colors.white,size: 15,),),
               ),

              ],
            ),
            RichText(text: const TextSpan(

              style: TextStyle(color: Colors.grey, fontSize: 20.0),
              children: <TextSpan>[
                TextSpan(

                    text: 'Greek salad or horiatiki salad is a popular salad in Greek cuisine generally made with pieces of tomatoes , cucumbers, onion,feta cheese,and olives and dressed with salt.',
                ),
              ],
            ),),
            const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text('Delivery Time',style: TextStyle(color: Colors.grey,fontSize: 20)),
                 SizedBox(width: 15,),
                 Icon(Icons.access_time,color: Colors.grey,),
                SizedBox(width: 5,),
                Text('15 min',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),

              ],
            ),
            const Text('Total Price',style: TextStyle(color: Colors.grey,fontSize: 20)),

          const Text(' \$32.00',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),

         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             FloatingActionButton(
                 onPressed: (){}
                  ,backgroundColor: Colors.black,
                 child: const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
               ),

           ],
         ),
          ],
    ),
     ),


    );
  }
}
