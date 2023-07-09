import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/pharamcy_list_screen.dart';
import 'screens/screen_search.dart';
import 'services/database_service.dart';
import 'screens/pharmacy_map_screen.dart';
import 'services/pharmacy_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PharmacyService>(create: (_) => PharmacyService(DatabaseService())),
      ],
      child: MaterialApp(
        title: 'Pharmacy App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) =>  SearchScreen(),
          '/list': (context) =>  PharmacyListScreen(),
          '/map': (context) => const PharmacyMapScreen(),
        },
      ),
    );
  }
}
