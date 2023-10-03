class User{
 String name='';
 int id=0;

 User( {required this.name,
 required this.id}){
   displayInfo();
 }

 void displayInfo(){
   print('Name:$name');
   print('Id:$id');

  }
}
