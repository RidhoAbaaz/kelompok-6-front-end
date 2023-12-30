// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:zoobeta/controllers/login_controller.dart';
import 'package:zoobeta/controllers/users_controller.dart';
import 'package:zoobeta/views/add.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFA3CCB0),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const Center(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Image(image: AssetImage('images/zoo.png')),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Login to Your Account',
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: username,
                          showCursor: true,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Username",
                              hintText: 'Ridho Abdul Aziz',
                              labelStyle: const TextStyle(color: Colors.black),
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      const BorderSide(color: Colors.red))),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: password,
                          showCursor: true,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Password",
                            hintText: 'abdulaziz',
                            labelStyle: const TextStyle(color: Colors.black),
                            border: const OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(
                                    color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                        child: Center(
                            child: SizedBox(
                                width: 300,
                                height: 35,
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color(0xFF86A789))),
                                    onPressed: () async {
                                      await saveUsername(username.text);
                                      await validateUsers(context,
                                          username.text, password.text);
                                    },
                                    child: const Text('Log in',
                                        style:
                                            TextStyle(color: Colors.white)))))),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('___________________\t'),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text('OR'),
                        ),
                        Text('\t___________________')
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Center(
                            child: SizedBox(
                                width: 300,
                                height: 35,
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color(0xFF86A789))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const AddPage()));
                                    },
                                    child: const Text('Sign up',
                                        style:
                                            TextStyle(color: Colors.white))))))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
