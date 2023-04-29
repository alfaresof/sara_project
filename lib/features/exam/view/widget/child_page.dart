import 'package:flutter/material.dart';

Scaffold ChildPage(BuildContext context) =>
    Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 180),
          const Center(
            child: Text(
              'Welcome to Child\'s Personality App',
              style: TextStyle(fontSize: 30),
            ),
          ),
          const SizedBox(height: 50),
          const Center(
            child: Text('Your child must be between age 7 and 12',
                style: TextStyle(fontSize: 30)),
          ),
          const SizedBox(height: 150),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/exam');
              },
              child: const Text('start Quiz'),
            ),
          )
        ],
      ),
    );