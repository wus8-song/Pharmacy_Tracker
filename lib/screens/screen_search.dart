
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
                if (medicineName.isNotEmpty) {
                  print('Searching for medicine: $medicineName');
                  Provider.of<PharmacyService>(context, listen: false)
                      .searchPharmaciesByMedicine(medicineName)
                      .then((_) {
                    Navigator.pushNamed(context, '/list');
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Search field is empty!'),
                  ));
                }
              },
              child: const Text('List'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String medicineName = _searchController.text;
                if (medicineName.isNotEmpty) {
                  await Provider.of<PharmacyService>(context, listen: false)
                      .searchPharmaciesByMedicine(medicineName);
                  Navigator.pushNamed(context, '/map');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Search field is empty!'),
                  ));
                }
              },
              child: const Text('Map'),
            ),
          ],
        ),
      ),
    );
  }
}




//class SearchScreen extends StatelessWidget {
  //final TextEditingController _searchController = TextEditingController();

  //@override
  //Widget build(BuildContext context) {
   // return Scaffold(
     // appBar: AppBar(
       // title: const Text('Search'),
      //),
      //body: Padding(
        //padding: const EdgeInsets.all(16.0),
        //child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          //children: [
            //TextField(
              //controller: _searchController,
              //decoration: const InputDecoration(
                //labelText: 'Search for medicine',
              //),
            //),
            //const SizedBox(height: 16.0),
            //ElevatedButton(
              //onPressed: () {
                //String medicineName = _searchController.text;
                //if (medicineName.isNotEmpty) {
                  //_searchMedicine(context, medicineName);
                //} else {
                  // Show a message or error indicating that the search field is empty
                //}
              //},
              //child: const Text('Search'),
            //),
          //],
        //),
      //),
    //);
  //}

  //void _searchMedicine(BuildContext context, String medicineName) {
    //PharmacyService pharmacyService = Provider.of<PharmacyService>(context, listen: false);
    //pharmacyService.searchPharmaciesByMedicine(medicineName);
    //Navigator.pushNamed(context, '/list');
  //}
//}
