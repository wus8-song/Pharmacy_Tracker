import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pharmacy.dart' as medicineName;
import '../services/pharmacy_service.dart';
import '../models/pharmacy.dart' as PharmacyModel;
import 'pharmacy_detail_screen.dart';
import '../models/medicine.dart' as MedicineModel;



class PharmacyListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PharmacyModel.Pharmacy> pharmacies = Provider.of<PharmacyService>(context).searchResults;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy List'),
      ),
      body: ListView.builder(
        itemCount: pharmacies.length,
        itemBuilder: (context, index) {
          PharmacyModel.Pharmacy pharmacy = pharmacies[index];

          List<MedicineModel.Medicine> searchedMedicines = pharmacy.medicines
              .where((medicine) => medicine.name.toLowerCase() == pharmacy.medicineName.toLowerCase())
              .toList();

          return ListTile(
            title: Text(pharmacy.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: searchedMedicines
                  .map((medicine) => Text('Medicine: ${medicine.name}'))
                  .toList(),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: searchedMedicines
                  .map((medicine) => Text('Quantity: ${medicine.currentStock}'))
                  .toList(),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PharmacyDetailScreen(pharmacy: pharmacy),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
