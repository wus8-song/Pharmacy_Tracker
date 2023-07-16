import '../models/medicine.dart' as MedicineModel;

class Pharmacy {
  final String name;
  final double lat;
  final double lon;
  final int medicineQuantity;
  final String id;
  final String? phoneNumber;
  final List<MedicineModel.Medicine> medicines;
  final String medicineName;

  Pharmacy({
    required this.name,
    required this.lat,
    required this.lon,
    required this.medicineQuantity,
    required this.id,
    this.phoneNumber,
    required this.medicines,
    required this.medicineName,
  });

  factory Pharmacy.fromJson(Map<String, dynamic> json) {
    return Pharmacy(
      name: json['name'],
      lat: json['lat'],
      lon: json['lon'],
      medicineQuantity: json['medicineQuantity'],
      id: json['id'],
      phoneNumber: json['phoneNumber'],
      medicines: List<MedicineModel.Medicine>.from(json['medicines'].map((medicineJson) => MedicineModel.Medicine.fromJson(medicineJson))),
      medicineName: json['medicineName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lat': lat,
      'lon': lon,
      'medicineQuantity': medicineQuantity,
      'id': id,
      'phoneNumber': phoneNumber,
      'medicines': medicines.map((medicine) => medicine.toJson()).toList(),
      'medicineName': medicineName,
    };
  }
}
