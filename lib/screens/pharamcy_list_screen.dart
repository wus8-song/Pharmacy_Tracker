import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pharmacy.dart';
import '../services/pharmacy_service.dart';
import '../models/pharmacy.dart' as PharmacyModel;
import 'pharmacy_detail_screen.dart';

class PharmacyListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PharmacyModel.Pharmacy> pharmacies = Provider.of<PharmacyService>(context).searchResults;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy List'),
      ),
      body: pharmacies.isEmpty
          ? Center(
        child: Text(
          'No pharmacies found.',
          style: TextStyle(fontSize: 16),
        ),
      )
          : ListView.builder(
        itemCount: pharmacies.length,
        itemBuilder: (context, index) {
          PharmacyModel.Pharmacy pharmacy = pharmacies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PharmacyDetailScreen(pharmacy: pharmacy),
                ),
              );
            },
            child: ListTile(
              title: Text(pharmacy.name),
              subtitle: Text('Medicine: ${pharmacy.medicineName}'),
              trailing: Text('Quantity: ${pharmacy.medicineQuantity}'),
            ),
          );
        },
      ),
    );
  }
}
