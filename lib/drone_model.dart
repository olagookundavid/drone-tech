class Drones {
  final String id;
  final String weightcap;
  final String manufacturer;
  final String serviced;
  final String dateacquired;

  Drones(
      {required this.id,
      required this.weightcap,
      required this.manufacturer,
      required this.serviced,
      required this.dateacquired});
  factory Drones.fromJson(Map<String, dynamic> json) {
    return Drones(
        id: json[''],
        weightcap: json[''],
        manufacturer: json[''],
        serviced: json[''],
        dateacquired: json['']);
  }
}
