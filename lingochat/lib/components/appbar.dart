import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    centerTitle: true,
    title: const Text(
      'LingoChat',
      style: TextStyle(
        fontSize: 24,
        fontFamily: 'Rubik-Regular',
        fontWeight: FontWeight.w900,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.more_vert, color: Colors.black),
        onPressed: () {
          print('More vert icon pressed');
        },
      ),
    ],
  );
}
