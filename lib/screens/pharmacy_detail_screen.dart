import 'package:flutter/material.dart';
import '../models/pharmacy.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/pharmacy_service.dart';
import 'package:provider/provider.dart';
import '../models/pharmacy.dart';
import '../services/pharmacy_service.dart';
import '../models/pharmacy.dart' as PharmacyModel;

class PharmacyDetailScreen extends StatelessWidget {
  final PharmacyModel.Pharmacy pharmacy;

  const PharmacyDetailScreen({required this.pharmacy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              pharmacy.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: Text(pharmacy.phoneNumber ?? 'N/A'),
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: Text('Lat: ${pharmacy.lat}, Lon: ${pharmacy.lon}'),
          ),
          ListTile(
            leading: const Icon(Icons.medical_services),
            title: Text('Medicine Quantity: ${pharmacy.medicineQuantity}'),
          ),
        ],
      ),
    );
  }
}
