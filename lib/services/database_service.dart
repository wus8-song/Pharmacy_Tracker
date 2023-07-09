
import '../models/medicine.dart';
import '../models/pharmacy.dart' as PharmacyModel;
import 'package:geolocator/geolocator.dart';

class DatabaseService {
  final List<PharmacyModel.Pharmacy> _pharmacies = [
    PharmacyModel.Pharmacy(
      name: 'Pharmacy 1',
      lat: 37.7749,
      lon: -122.4194,
      medicineQuantity: 10,
      id: '1',
      medicines: [
        Medicine(id: '1', name: 'Medicine A', currentStock: 5),
        Medicine(id: '2', name: 'Medicine B', currentStock: 3),
      ],
      medicineName: 'Medicine A',
    ),
    PharmacyModel.Pharmacy(
      name: 'Pharmacy 2',
      lat: 37.7833,
      lon: -122.4167,
      medicineQuantity: 5,
      id: '2',
      medicines: [
        Medicine(id: '3', name: 'Medicine C', currentStock: 8),
        Medicine(id: '4', name: 'Medicine D', currentStock: 2),
      ],
      medicineName: 'Medicine C',
    ),
    PharmacyModel.Pharmacy(
      name: 'Pharmacy 3',
      lat: 37.7914,
      lon: -122.4086,
      medicineQuantity: 8,
      id: '3',
      medicines: [
        Medicine(id: '5', name: 'Medicine E', currentStock: 6),
        Medicine(id: '6', name: 'Medicine F', currentStock: 4),
      ],
      medicineName: 'Medicine E',
    ),
  ];

  Future<List<PharmacyModel.Pharmacy>> getPharmaciesWithMedicine(
      String medicineName, Position? userPosition) async {
    // Filter the pharmacies that have the requested medicine in stock
    List<PharmacyModel.Pharmacy> pharmaciesWithMedicine = _pharmacies
        .where((pharmacy) => pharmacy.medicines
        .any((medicine) => medicine.name.toLowerCase() == medicineName.toLowerCase()))
        .toList();

    if (userPosition != null) {
      // Calculate the distance from the user to each pharmacy
      for (PharmacyModel.Pharmacy pharmacy in pharmaciesWithMedicine) {
        double distanceInMeters = Geolocator.distanceBetween(
          userPosition.latitude,
          userPosition.longitude,
          pharmacy.lat,
          pharmacy.lon,
        );

        // Convert the distance to kilometers and store it in the pharmacy object
        pharmacy.distance = distanceInMeters / 1000;
      }

      // Sort the pharmacies by distance (from nearest to farthest)
      pharmaciesWithMedicine.sort((a, b) {
        if (a.distance == null && b.distance == null) {
          return 0;
        } else if (a.distance == null) {
          return 1;
        } else if (b.distance == null) {
          return -1;
        } else {
          return a.distance!.compareTo(b.distance!);
        }
      });
    }

    return pharmaciesWithMedicine;
  }
}


//class DatabaseService {
 // Future<List<Pharmacy>> getNearestPharmacies() async {
    // TODO: Implement the logic to fetch the nearest pharmacies based on the user's location
    // You can use any location service library (e.g., geolocator) to get the user's current location
    // Once you have the user's location, query your database or any other data source to fetch the nearest pharmacies
    // Example: Return a list of dummy pharmacies with their names, coordinates, and medicine quantities
   // return [
     // Pharmacy(name: 'Pharmacy 1', lat: 37.7749, lon: -122.4194, medicineQuantity: 10, id: '', phoneNumber: null, medicines: [], medicineName: ''),
      //Pharmacy(name: 'Pharmacy 2', lat: 37.7833, lon: -122.4167, medicineQuantity: 5, id: '', phoneNumber: null, medicines: [], medicineName: ''),
      //Pharmacy(name: 'Pharmacy 3', lat: 37.7914, lon: -122.4086, medicineQuantity: 8, id: '', phoneNumber: null, medicines: [], medicineName: ''),
    //];
 // }

  //Future<List<Pharmacy>> getPharmaciesWithMedicine(String medicineName) async {
    // TODO: Implement the logic to fetch the pharmacies that have the specified medicine in stock
    // Query your database or any other data source based on the medicine name
    // Example: Return a list of dummy pharmacies with their names, coordinates, and medicine quantities
    //return [
      //Pharmacy(name: 'Pharmacy 1', lat: 37.7749, lon: -122.4194, medicineQuantity: 10, id: '', phoneNumber: null, medicines: [], medicineName: ''),
      //Pharmacy(name: 'Pharmacy 2', lat: 37.7833, lon: -122.4167, medicineQuantity: 5, id: '', phoneNumber: null, medicines: [], medicineName: ''),
      //Pharmacy(name: 'Pharmacy 3', lat: 37.7914, lon: -122.4086, medicineQuantity: 8, id: '', phoneNumber: null, medicines: [], medicineName: ''),
    //];
  //}

  //void searchPharmacies(String medicineName) {}
//}
