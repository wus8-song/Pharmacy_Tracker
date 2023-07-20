import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../models/medicine.dart';
import '../models/pharmacy.dart' as PharmacyModel;
import 'database_service.dart';
import 'package:flutter/material.dart';
import '../models/medicine.dart' as MedicineModel;

class PharmacyService with ChangeNotifier {
  final DatabaseService _databaseService;
  List<PharmacyModel.Pharmacy> _searchResults = [];
  Position? _userPosition;

  PharmacyService(this._databaseService);

  List<PharmacyModel.Pharmacy> get searchResults => _searchResults;

  Position? get userPosition => _userPosition;

  Future<void> searchPharmaciesByMedicine(String medicineName) async {
    try {
      _userPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<PharmacyModel.Pharmacy> allPharmacies = await _databaseService.getPharmacies();

      _searchResults = allPharmacies
          .where((pharmacy) => pharmacy.medicines.any((medicine) => medicine.name.toLowerCase() == medicineName.toLowerCase()))
          .toList();

      notifyListeners();
    } catch (error) {
      print('Error searching pharmacies: $error');
      throw error;
    }
  }

}





