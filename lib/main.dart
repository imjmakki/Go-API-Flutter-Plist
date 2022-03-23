import 'dart:html';

import 'package:flutter/material.dart';
import 'productModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(AppRun());
}

class AppRun extends StatefulWidget {
  const AppRun({Key? key}) : super(key: key);

  @override
  State<AppRun> createState() => _AppRunState();
}

class _AppRunState extends State<AppRun> {
  double fetchCountPercentage = 10;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: SizedBox.expand(
          child: Stack(
            children: [
              FutureBuilder<List<Product>>(
                future: fetchFromServer(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}",
                          style: TextStyle(color: Colors.redAccent)),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            title: Text(snapshot.data[index].name),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Product>> fetchFromServer() async {
    var url = "http://65.0.125.153:5500/products/$fetchCountPercentage";
    var response = await http.get(url);

    List<Product> productList = [];
    if (response.statusCode == 200) {
      var productMap = convert.jsonDecode(response.body);
      for (final item in productMap) {
        productList.add(Product.fromJson(item));
      }
    }
    return productList;
  }
}
