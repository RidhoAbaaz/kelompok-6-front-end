import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zoobeta/controllers/layouts.dart';
import 'package:zoobeta/models/amfiibi.dart';
import 'package:zoobeta/models/aves.dart';
import 'package:zoobeta/models/mamalia.dart';
import 'package:zoobeta/models/pisces.dart';
import 'package:zoobeta/models/reptile.dart';

Future<List<Mamalia>> getMammals() async {
  final response = await http.get(Uri.parse('$url/mamalia'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body)['data'];
    List<Mamalia> mammals = data.map((json) => Mamalia.fromJson(json)).toList();
    return mammals;
  } else {
    throw Exception('maaf data anda tidak bisa di proses');
  }
}

Future<List<Aves>> getAves() async {
  final response = await http.get(Uri.parse('$url/aves'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body)['data'];
    List<Aves> aves = data.map((json) => Aves.fromJson(json)).toList();
    return aves;
  } else {
    throw Exception('maaf data anda tidak bisa di proses');
  }
}

Future<List<Reptile>> getReptiles() async {
  final response = await http.get(Uri.parse('$url/reptile'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body)['data'];
    List<Reptile> reptiles =
        data.map((json) => Reptile.fromJson(json)).toList();
    return reptiles;
  } else {
    throw Exception('maaf data anda tidak bisa di proses');
  }
}

Future<List<Pisces>> getPisces() async {
  final response = await http.get(Uri.parse('$url/pisces'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body)['data'];
    List<Pisces> pisces = data.map((json) => Pisces.fromJson(json)).toList();
    return pisces;
  } else {
    throw Exception('maaf data anda tidak bisa di proses');
  }
}

Future<List<Amfibi>> getAmfibi() async {
  final response = await http.get(Uri.parse('$url/amfibi'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body)['data'];
    List<Amfibi> amfibi = data.map((json) => Amfibi.fromJson(json)).toList();
    return amfibi;
  } else {
    throw Exception('maaf data anda tidak bisa di proses');
  }
}
