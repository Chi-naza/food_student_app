import 'package:flutter/material.dart';
import 'package:food_app2/src/features/model/cat_data_model.dart';
import 'package:http/http.dart' as http;

class NetworkRequestsScreen extends StatefulWidget {
  const NetworkRequestsScreen({super.key});

  @override
  State<NetworkRequestsScreen> createState() => _NetworkRequestsScreenState();
}

class _NetworkRequestsScreenState extends State<NetworkRequestsScreen> {
  List<CatDataModel> ourCatData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 75,
          ),
          Container(
            child: Text("Get MANY Cats"),
          ),
          SizedBox(
            height: 45,
          ),
          ElevatedButton(
            onPressed: () {
              fetchCatDetails(5);
            },
            child:
                Text("GET NOW", style: Theme.of(context).textTheme.titleLarge),
          ),
        ],
      ),
    );
  }

  Future<void> fetchCatDetails(int limit) async {
    var url = Uri.parse("https://catfact.ninja/breeds?limit=$limit");

    try {
      var response = await http.get(url);

      var body = response.body;
      print('Response status: ${response.statusCode}');
      print('Response body: $body');
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
