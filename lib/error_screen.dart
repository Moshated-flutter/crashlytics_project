import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
              itemCount: 20,
              itemBuilder: (context, index) => IconButton(
                onPressed: () {
                  throw Exception();
                },
                icon: Icon(
                  Icons.error_outline,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              errorFromNetwork();
            },
            child: Text('error server'),
          )
        ],
      ),
    );
  }

  Future<void> errorFromNetwork() async {
    final Dio dio = Dio();
    try {
      Response response = await dio.get('http://atun.net/api/v1/recipes/50');
      if (response.statusCode == 200) {
      } else {
        throw Error();
      }
    } catch (e) {
      throw TimeoutException(e.toString());
    }
  }
}
