
import 'package:geolocator_platform_interface/src/models/position.dart';
import '../models/medicine.dart' as MedicineModel;
import '../models/pharmacy.dart' as PharmacyModel;


class DatabaseService {
  Future<List<PharmacyModel.Pharmacy>> getPharmaciesWithMedicine(
      String medicineName, Position userPosition) async {
    List<PharmacyModel.Pharmacy> filteredPharmacies =
    dummyPharmacies.where((pharmacy) {
      return pharmacy.medicines.any((medicine) =>
      medicine.name.toLowerCase() == medicineName.toLowerCase());
    }).toList();

    return filteredPharmacies;
  }
}

List<PharmacyModel.Pharmacy> dummyPharmacies = [
PharmacyModel.Pharmacy(
name: 'Pharmacy 1',
lat: 37.7749,
lon: -122.4194,
medicineQuantity: 10,
id: '1',
phoneNumber: '+123456789',
medicines: [
MedicineModel.Medicine(id: '1', name: 'Medicine A', currentStock: 5),
MedicineModel.Medicine(id: '2', name: 'Medicine B', currentStock: 3),
MedicineModel.Medicine(id: '3', name: 'Medicine C', currentStock: 2),
MedicineModel.Medicine(id: '4', name: 'Medicine D', currentStock: 4),
MedicineModel.Medicine(id: '5', name: 'Medicine E', currentStock: 1),
],
medicineName: 'Medicine A',
),
PharmacyModel.Pharmacy(
name: 'Pharmacy 2',
lat: 37.7833,
lon: -122.4167,
medicineQuantity: 5,
id: '2',
phoneNumber: '+987654321',
medicines: [
  MedicineModel.Medicine(id: '1', name: 'Medicine A', currentStock: 6),
  MedicineModel.Medicine(id: '6', name: 'Medicine F', currentStock: 6),
  MedicineModel.Medicine(id: '7', name: 'Medicine G', currentStock: 2),
  MedicineModel.Medicine(id: '8', name: 'Medicine H', currentStock: 3),
  MedicineModel.Medicine(id: '9', name: 'Medicine I', currentStock: 1),
],
medicineName: 'Medicine F',
),
PharmacyModel.Pharmacy(
name: 'Pharmacy 3',
lat: 37.7914,
lon: -122.4086,
medicineQuantity: 8,
id: '3',
phoneNumber: '+111222333',
medicines: [
  MedicineModel.Medicine(id: '1', name: 'Medicine A', currentStock: 7),
  MedicineModel.Medicine(id: '11', name: 'Medicine K', currentStock: 7),
  MedicineModel.Medicine(id: '12', name: 'Medicine L', currentStock: 2),
  MedicineModel.Medicine(id: '13', name: 'Medicine M', currentStock: 3),
  MedicineModel.Medicine(id: '14', name: 'Medicine N', currentStock: 5),
],
medicineName: 'Medicine K',
),
PharmacyModel.Pharmacy(
name: 'Pharmacy 4',
lat: 37.7519,
lon: -122.4342,
medicineQuantity: 12,
id: '4',
phoneNumber: '+444555666',
medicines: [
  MedicineModel.Medicine(id: '1', name: 'Medicine A', currentStock: 8),
  MedicineModel.Medicine(id: '15', name: 'Medicine O', currentStock: 6),
  MedicineModel.Medicine(id: '16', name: 'Medicine P', currentStock: 2),
  MedicineModel.Medicine(id: '17', name: 'Medicine Q', currentStock: 3),
  MedicineModel.Medicine(id: '18', name: 'Medicine R', currentStock: 4),
],
medicineName: 'Medicine P',
),
PharmacyModel.Pharmacy(
name: 'Pharmacy 5',
lat: 37.8085,
lon: -122.4199,
medicineQuantity: 7,
id: '5',
phoneNumber: '+777888999',
medicines: [
  MedicineModel.Medicine(id: '1', name: 'Medicine A', currentStock: 9),
  MedicineModel.Medicine(id: '19', name: 'Medicine S', currentStock: 7),
  MedicineModel.Medicine(id: '20', name: 'Medicine T', currentStock: 3),
  MedicineModel.Medicine(id: '21', name: 'Medicine U', currentStock: 2),
  MedicineModel.Medicine(id: '22', name: 'Medicine V', currentStock: 5),
],
medicineName: 'Medicine U',
)];

