import 'package:flutter/material.dart';
import '../models/pharmacy.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/pharmacy_service.dart';
import 'package:provider/provider.dart';
import '../models/pharmacy.dart';
import '../services/pharmacy_service.dart';


class PharmacyDetailScreen extends StatelessWidget {
  final Pharmacy pharmacy;

  const PharmacyDetailScreen({Key? key, required this.pharmacy}) : super(key: key);

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
