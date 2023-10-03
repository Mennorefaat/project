import 'package:untitled1/oop/userclass.dart';
class Doctor extends User{
  String clinicLocation='';
  String clinicLicences='';
  Doctor({required super.name, required super.id,
    required this.clinicLicences,required this.clinicLocation});
  @override
  displayInfo(){
    super.displayInfo();
    print('Clinic Location :$clinicLocation');
    print('Clinic Licences :$clinicLicences');
  }
}
void main(){
  Doctor doctor=Doctor(name: 'Omnia', id: 7, clinicLicences: '34947surgery', clinicLocation: 'Nasr City');
}
