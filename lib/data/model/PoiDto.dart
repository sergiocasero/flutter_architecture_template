class PoiDto {
    String geocoordinates;
    String id;
    String title;

    PoiDto({this.geocoordinates, this.id, this.title});

    factory PoiDto.fromJson(Map<String, dynamic> json) {
        return PoiDto(
            geocoordinates: json['geocoordinates'], 
            id: json['id'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['geocoordinates'] = this.geocoordinates;
        data['id'] = this.id;
        data['title'] = this.title;
        return data;
    }
}