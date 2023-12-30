// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zoobeta/controllers/layouts.dart';
import 'package:zoobeta/models/users.dart';

Future<Users> fetchUser(String user) async {
  final response = await http.get(Uri.parse('$url/users/name/$user'));

  if (response.statusCode == 200) {
    dynamic data = json.decode(response.body)['data'];
    if (data is List) {
      if (data.isNotEmpty) {
        data = data[0];
      } else {
        throw Exception('User not found! Please double-check your username!');
      }
    }
    Users user = Users.fromJson(data);
    return user;
  } else {
    throw Exception('The data must not be empty.');
  }
}

Future<void> validateUsers(
    BuildContext context, String username, String password) async {
  void popUp(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  try {
    loadingIndicator(context, 'Please Wait');
    Users user = await fetchUser(username);
    Navigator.pop(context);
    if (username == user.username && password == user.password) {
      Navigator.pushNamed(context, '/home');
      popUp('welcome, $username!');
    } else {
      popUp('The password or username entered is incorrect!');
    }
  } catch (e) {
    Navigator.pop(context);
    popUp('error $e');
  }
}
