import 'package:flutter_architecture_template/data/model/PoiDto.dart';

class PoiResponseDto {
    List<PoiDto> list;

    PoiResponseDto({this.list});

    factory PoiResponseDto.fromJson(Map<String, dynamic> json) {
        return PoiResponseDto(
            list: json['list'] != null ? (json['list'] as List).map((i) => PoiDto.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.list != null) {
            data['list'] = this.list.map((v) => v.toJson()).toList();
        }
        return data;
    }
}