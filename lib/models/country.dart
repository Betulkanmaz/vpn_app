import 'dart:core';

class Country {
  final String name;
  final String flag;
  final String? city;
  final int locationCount;
  final int strength;
  final bool isConnected;

  Country({
    required this.name,
    required this.flag,
    this.city,
    required this.locationCount,
    required this.strength,
    this.isConnected = false,
  });

  Country copyWith({
    final String? name,
    final String? flag,
    final String? city,
    final int? locationCount,
    final int? strength,
    final bool? isConnected,
  }) {
    return Country(
      name: name ?? this.name,
      flag: flag ?? this.flag,
      city: city ?? this.city,
      locationCount: locationCount ?? this.locationCount,
      strength: strength ?? this.strength,
      isConnected: isConnected ?? this.isConnected,
    );
  }
}
