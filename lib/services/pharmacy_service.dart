import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../models/medicine.dart';
import '../models/pharmacy.dart' as PharmacyModel;
import 'database_service.dart';
import 'package:flutter/material.dart';


class PharmacyService with ChangeNotifier {
  final DatabaseService _databaseService;
  Position? _userPosition;
  List<PharmacyModel.Pharmacy> _searchResults = [];

  PharmacyService(this._databaseService);

  List<PharmacyModel.Pharmacy> get searchResults => _searchResults;
  Position? get userPosition => _userPosition;

  Future<void> searchPharmaciesByMedicine(String medicineName) async {
    try {
      _userPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      _searchResults = await _databaseService.getPharmaciesWithMedicine(medicineName, _userPosition);
      notifyListeners();
    } catch (error) {
      print('Error searching pharmacies: $error');
      throw error;
    }
  }
}




//class PharmacyService with ChangeNotifier {
  //final DatabaseService _databaseService;

  //List<Pharmacy> _searchResults = [];

  //PharmacyService(this._databaseService);

  //List<Pharmacy> get searchResults => _searchResults;

  //Future<void> searchPharmaciesByMedicine(String medicineName) async {
    //try {
      //List<Pharmacy> pharmacies = await _databaseService.getPharmaciesWithMedicine(medicineName);
      //_searchResults = pharmacies;
     // notifyListeners();
    //} catch (error) {
     // print('Error searching pharmacies: $error');
     // throw error;
    //}
  //}
//}
