import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

Map mapResponse = Map();
Map dataResponse = Map();
List listResponse = [];

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  Future apicall() async {
    http.Response response;
    response =
        await http.get(Uri.parse("https://krishivikas.com/api/category"));

    if (response.statusCode == 200) {
      setState(() {
        mapResponse = jsonDecode(response.body);
        listResponse = mapResponse['data'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    apicall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 178, 238, 253)),
              width: 200,
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        listResponse[index]['icon'],
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "category:${listResponse[index]['category'].toString()}",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
            );
          },
          itemCount: listResponse == null ? 0 : listResponse.length,
        ),
      ),
    );
  }
}
