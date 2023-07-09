import 'package:ist_440w_first_draft/models/medicine.dart';

class Pharmacy {
  String name;
  double lat;
  double lon;
  int medicineQuantity;
  String id;
  String? phoneNumber;
  Object medicines;
  String medicineName;
  double? distance;

  Pharmacy({
    required this.name,
    required this.lat,
    required this.lon,
    required this.medicineQuantity,
    required this.id,
    this.phoneNumber,
    required this.medicines,
    required this.medicineName,
    this.distance,
  });

}



//class Pharmacy {
  //final String id;
  //final String name;
  //final String medicineName;
  //final double lat;
  //final double lon;
  //final int? medicineQuantity;
  //final List<Medicine> medicines;
  //var phoneNumber;


  

 // Pharmacy(this.medicineName,  {
  //required this.id,
  //required this.name,
  //required this.lat,
  //required this.lon,
  //required this.medicineQuantity,
  //required this.phoneNumber,
  //required this.medicines,
  //});
//}
   // required this.id,
    //required this.name,
    //required this.medicineName,
    //required this.lat,
    //required this.lon,

    //required this.medicineQuantity, required phoneNumber, required List<Medicine> medicines,
 // });

  //factory Pharmacy.fromJson(Map<String, dynamic> json) {
   // return Pharmacy(
    //  id: json['id'],
     // name: json['name'],
     // lat: json['lat'],
     // lon: json['lon'],
     // medicineQuantity: json['medicineQuantity'], phoneNumber: null, medicines: [], medicineName: '',
   // );
  //}

  //get medicines => null;

  //get phoneNumber => null;

  //Map<String, dynamic> toJson() {
    //return {
      //'id': id,
      //'name': name,
      //'lat': lat,
      //'lon': lon,
      //'medicineQuantity': medicineQuantity,
    //};
  //}
//}
