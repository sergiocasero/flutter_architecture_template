import 'dart:convert';

import 'package:flutter_architecture_template/data/datasource/remote/Remote.dart';
import 'package:flutter_architecture_template/data/model/PoiResponseDto.dart';
import 'package:flutter_architecture_template/domain/model/Poi.dart';
import 'package:http/http.dart';

class HttpRemote extends Remote {
  String _endpoint = "https://t21services.herokuapp.com/points";

  final Client _client;

  HttpRemote(this._client);

  @override
  Future<List<Poi>> getPois() async {
    final response = await _client.get(_endpoint);
    final dto = PoiResponseDto.fromJson(jsonDecode(response.body));
    return dto.list.map((e) => e.toPoi()).toList();
  }
}
