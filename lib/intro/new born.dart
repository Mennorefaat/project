//Complete the project by Creating the class that prints the
// following output.
class Person{
  String name ="";
  int age=0;
  
  
  Person.newborn( this.name,){
    printData();
  }
  Person.fromAge(this.name,this.age){
    printData();
  }
  void printData(){
    if(age==0){
    print('Newborn Person: Name - $name, Age - $age');}
    else{
    print('Person with age: Name - $name, Age - $age');}
  }

}
void main(){
   Person newbornPerson =Person.newborn("Alice");
   Person PersonWithAge = Person.fromAge("Bob",25);

}