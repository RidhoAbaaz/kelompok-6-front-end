// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:zoobeta/controllers/layouts.dart';
import 'package:zoobeta/controllers/users_controller.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController tanggal_lahir = TextEditingController();
  final TextEditingController region = TextEditingController();
  final TextEditingController no_telepon = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext maincontext) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 178, 200, 186),
      body: Center(
        child: Form(
            child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: const Text(
                    'Create Your Account',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: username,
                    showCursor: true,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 241, 234, 255),
                        filled: true,
                        labelText: "Username",
                        labelStyle: const TextStyle(color: Colors.black),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.red))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: tanggal_lahir,
                    showCursor: true,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        hintText: 'DD-MM-YY',
                        fillColor: const Color.fromARGB(255, 241, 234, 255),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.red)),
                        labelText: "Birthday",
                        labelStyle: const TextStyle(color: Colors.black),
                        border: const OutlineInputBorder()),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: gender,
                    showCursor: true,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        hintText: 'perempuan/laki laki',
                        fillColor: const Color.fromARGB(255, 241, 234, 255),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.red)),
                        labelText: "Gender",
                        labelStyle: const TextStyle(color: Colors.black),
                        border: const OutlineInputBorder()),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: region,
                    showCursor: true,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 241, 234, 255),
                        filled: true,
                        labelText: "Region",
                        labelStyle: const TextStyle(color: Colors.black),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.red))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: no_telepon,
                    showCursor: true,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 241, 234, 255),
                        filled: true,
                        labelText: "No Telepon",
                        labelStyle: const TextStyle(color: Colors.black),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.red))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: email,
                    showCursor: true,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 241, 234, 255),
                        filled: true,
                        labelText: "Email",
                        labelStyle: const TextStyle(color: Colors.black),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.red))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: password,
                    showCursor: true,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 241, 234, 255),
                        filled: true,
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.black),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.red))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('_________________\t'),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('Next'),
                    ),
                    Text('\t_________________')
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 134, 167, 137))),
                      onPressed: () async {
                        // print(username.text);
                        // print(tanggal_lahir.text);
                        // print(gender.text);
                        // print(region.text);
                        // print(no_telepon.text);
                        // print(email.text);
                        // print(password.text);

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             const LoginPage()));    loadingIndicator(context, 'menambahkan users');
                        loadingIndicator(maincontext, 'adding user');
                        await addUser(
                            context,
                            username.text,
                            tanggal_lahir.text,
                            gender.text,
                            region.text,
                            no_telepon.text,
                            email.text,
                            password.text);
                        username.clear();
                        tanggal_lahir.clear();
                        gender.clear();
                        region.clear();
                        no_telepon.clear();
                        email.clear();
                        password.clear();
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
