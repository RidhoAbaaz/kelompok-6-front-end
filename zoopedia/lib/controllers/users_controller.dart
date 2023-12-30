// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zoobeta/controllers/layouts.dart';
import 'package:zoobeta/models/users.dart';
import 'package:zoobeta/views/login.dart';

Future<void> addUser(
    BuildContext context,
    String username,
    String tanggal_lahir,
    String gender,
    final String region,
    final String no_telepon,
    String email,
    String password) async {
  loadingIndicator(context, 'adding users');
  final response = await http.post(
    Uri.parse('$url/users'),
    body: jsonEncode({
      'username': username,
      'tanggal_lahir': tanggal_lahir,
      'gender': gender,
      'region': region,
      'no_telepon': no_telepon,
      'email': email,
      'password': password,
    }),
    headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8',
    },
  );
  Navigator.pop(context);
  if (response.statusCode == 200) {
    // tambahkan aksi lain jika sukses
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage()));
    final snackBar = SnackBar(
      content: const Text('users success added'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  } else {
    throw Exception('failed adding user');
  }
}

// Simpan nama pengguna setelah login
Future<void> saveUsername(String username) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('username', username);
}

Future<List<Users>> getUsers(String username) async {
  final response = await http.get(Uri.parse('$url/users/name/$username'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body)['data'];
    List<Users> user = data.map((json) => Users.fromJson(json)).toList();
    return user;
  } else {
    throw Exception('maaf data anda tidak bisa di proses');
  }
}
