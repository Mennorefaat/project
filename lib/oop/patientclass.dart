
import 'package:untitled1/oop/userclass.dart';

class Patient extends User{
  int phoneNumber=0;
  Patient({required super.name, required super.id ,required this.phoneNumber});
  @override
  displayInfo(){
   super.displayInfo();
    print('Phone Number:$phoneNumber');
  }
}
void main(){
  Patient patient=Patient(name: 'aly', id: 4, phoneNumber: 01032659426);
}