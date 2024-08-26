import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app2/src/features/model/cat_data_model.dart';
import 'package:http/http.dart' as http;

class NetworkRequestsScreen extends StatefulWidget {
  const NetworkRequestsScreen({super.key});

  @override
  State<NetworkRequestsScreen> createState() => _NetworkRequestsScreenState();
}

class _NetworkRequestsScreenState extends State<NetworkRequestsScreen> {
  List<CatDataModel> ourCatDataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("MANY CATs"),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                fetchCatDetails(5);
                // testLoop();
              },
              child: Text(
                "GET NOW",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
              child: ListView.builder(
                itemCount: ourCatDataList.length,
                itemBuilder: (context, index) {
                  var cat = ourCatDataList[index];

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          "${index + 1}). ${cat.breed}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Breed - ${cat.breed}"),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> fetchCatDetails(int limit) async {
    var url = Uri.parse("https://catfact.ninja/breeds?limit=$limit");

    try {
      var response = await http.get(url);

      var body = jsonDecode(response.body);
      print('Response status: ${response.statusCode}');
      print('Response body: $body');

      if (response.statusCode == 200) {
        for (var cat in body["data"]) {
          var data = CatDataModel.fromJson(cat);
          ourCatDataList.add(data);
        }
        setState(() {});
        print('Coverted Cat Data: $ourCatDataList');
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
