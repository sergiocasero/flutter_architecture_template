import 'package:flutter_architecture_template/data/model/PoiDto.dart';

class Poi {
  final String id;
  final String title;
  final double lat;
  final double lng;

  Poi(this.id, this.title, this.lat, this.lng);

  factory Poi.fromDto(PoiDto dto) {
    final geoData = dto.geocoordinates.split(",");
    return Poi(dto.id, dto.title, double.parse(geoData[0]), double.parse(geoData[1]));
  }

  PoiDto toDto() {
    return PoiDto(
      id: id,
      title: title,
      geocoordinates: "$lat,$lng",
    );
  }
}
