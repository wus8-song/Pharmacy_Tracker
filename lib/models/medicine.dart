class Medicine {
  final String id;
  final String name;
  final int? currentStock;
  final int? quantity;

  Medicine({
    required this.id,
    required this.name,
    this.currentStock,
    this.quantity,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['id'],
      name: json['name'],
      currentStock: json['currentStock'] != null ? json['currentStock'] as int : null,
      quantity: json['quantity'] != null ? json['quantity'] as int : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'currentStock': currentStock,
      'quantity': quantity,
    };
  }
}

class Pharmacy {
  final String id;
  final String name;
  final String medicineName;
  final double lat;
  final double lon;
  final int? medicineQuantity;
  final List<Medicine> medicines;

  Pharmacy({
    required this.id,
    required this.name,
    required this.medicineName,
    required this.lat,
    required this.lon,
    this.medicineQuantity,
    required this.medicines,
  });

  factory Pharmacy.fromJson(Map<String, dynamic> json) {
    List<Medicine> medicines = [];
    if (json['medicines'] != null) {
      var medicineList = json['medicines'] as List;
      medicines = medicineList.map((item) => Medicine.fromJson(item)).toList();
    }

    return Pharmacy(
      id: json['id'],
      name: json['name'],
      medicineName: json['medicineName'],
      lat: json['lat'],
      lon: json['lon'],
      medicineQuantity: json['medicineQuantity'],
      medicines: medicines,
    );
  }


  set distance(double distance) {}

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'medicineName': medicineName,
      'lat': lat,
      'lon': lon,
      'medicineQuantity': medicineQuantity,
      'medicines': medicines.map((medicine) => medicine.toJson()).toList(),
    };
  }
}
