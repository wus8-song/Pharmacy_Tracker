
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pharmacy.dart';
import '../services/database_service.dart';
import '../services/pharmacy_service.dart';
import 'pharamcy_list_screen.dart';
import 'pharmacy_map_screen.dart';
import '../models/medicine.dart';


class SearchScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search for medicine',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String medicineName = _searchController.text;
                if (medicineName.isNotEmpty &&
                    _isValidMedicineName(medicineName)) {
                  print('Searching for medicine: $medicineName');
                  Provider.of<PharmacyService>(context, listen: false)
                      .searchPharmaciesByMedicine(medicineName)
                      .then((_) {
                    Navigator.pushNamed(context, '/list');
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Invalid Medicine Name'),
                      content: const Text('Please enter a valid medicine name.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('List'),
            ),
          ],
        ),
      ),
    );
  }

  bool _isValidMedicineName(String medicineName) {
    List<String> validMedicineNames = [
      'Medicine A',
      'Medicine B',
      'Medicine C',
      'Medicine D',
      'Medicine E',
      'Medicine F',
      'Medicine G',
      'Medicine H',
      'Medicine I',
      'Medicine J',
      'Medicine K',
      'Medicine L',
      'Medicine M',
      'Medicine N',
      'Medicine O',
      'Medicine P',
      'Medicine Q',
      'Medicine R',
      'Medicine S',
      'Medicine T',
      'Medicine U',
      'Medicine V',
      'Medicine W',
      'Medicine X',
      'Medicine Z',
    ];
    return validMedicineNames.contains(medicineName);
  }
}
