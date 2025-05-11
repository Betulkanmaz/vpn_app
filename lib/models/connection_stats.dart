import 'package:vpn_app/models/country.dart';

class ConnectionStats {
  final int downloadSpeed;
  final int uploadSpeed;
  final Duration connectedTime;
  final Country? connectedCountry;

  ConnectionStats({
    required this.downloadSpeed,
    required this.uploadSpeed,
    required this.connectedTime,
    this.connectedCountry,
  });

  ConnectionStats copyWith({
    int? downloadSpeed,
    int? uploadSpeed,
    Duration? connectedTime,
    Country? connectedCountry,
  }) {
    return ConnectionStats(
      downloadSpeed: downloadSpeed ?? this.downloadSpeed,
      uploadSpeed: uploadSpeed ?? this.uploadSpeed,
      connectedTime: connectedTime ?? this.connectedTime,
      connectedCountry: connectedCountry ?? this.connectedCountry,
    );
  }
}
