import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pharmacy.dart';
import '../services/pharmacy_service.dart';
import '../models/pharmacy.dart' as PharmacyModel;
import 'pharmacy_detail_screen.dart';

class PharmacyListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Pharmacy> pharmacies = Provider.of<PharmacyService>(context).searchResults;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy List'),
      ),
      body: ListView.builder(
        itemCount: pharmacies.length,
        itemBuilder: (context, index) {
          Pharmacy pharmacy = pharmacies[index];
          return ListTile(
            title: Text(pharmacy.name),
            subtitle: Text('Medicine: ${pharmacy.medicines.first.name}'), // Displaying the first medicine's name
            trailing: Text('Quantity: ${pharmacy.medicines[0].currentStock}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PharmacyDetailScreen(pharmacy: pharmacy), // Pass the selected pharmacy to the detail screen
                ),
              );
            },
          );
        },
      ),
    );
  }
}
