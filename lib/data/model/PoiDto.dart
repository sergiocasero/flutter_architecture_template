import '../../domain/model/Poi.dart';

class PoiDto {
    String geocoordinates;
    String id;
    String title;

    PoiDto({this.geocoordinates, this.id, this.title});

    factory PoiDto.fromMap(Map<String, dynamic> json) {
        return PoiDto(
            geocoordinates: json['geocoordinates'], 
            id: json['id'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toMap() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['geocoordinates'] = this.geocoordinates;
        data['id'] = this.id;
        data['title'] = this.title;
        return data;
    }

    factory PoiDto.fromPoi(Poi poi) {
      return PoiDto(
        id: poi.id,
        title: poi.title,
        geocoordinates: "${poi.lat},${poi.lng}",
      );
    }
    
    Poi toPoi() {
      final geoData = this.geocoordinates.split(",");
      return Poi(this.id, this.title, double.parse(geoData[0]), double.parse(geoData[1]));
    }



}