import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/pharmacy_service.dart';
import 'package:provider/provider.dart';
import 'pharmacy_detail_screen.dart' as PharmacyDetailScreenPage;

class PharmacyMapScreen extends StatelessWidget {
  const PharmacyMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pharmacies = Provider.of<PharmacyService>(context).searchResults;
    Position? userPosition = Provider.of<PharmacyService>(context).userPosition;

    Set<Marker> markers = pharmacies.map((pharmacy) {
      return Marker(
        markerId: MarkerId(pharmacy.id.toString()),
        position: LatLng(pharmacy.lat, pharmacy.lon),
        infoWindow: InfoWindow(
          title: pharmacy.name,
          snippet: 'Medicine Quantity: ${pharmacy.medicineQuantity}',
        ),
      );
    }).toSet();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: userPosition != null ? LatLng(userPosition.latitude, userPosition.longitude) : LatLng(37.7749, -122.4194), // Default map location (San Francisco)
          zoom: 12.0,
        ),
        markers: markers,
      ),
    );
  }
}


