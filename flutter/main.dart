import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:grproject/detailpage.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List productData;

  Future<List> getProduct() async{
    const String url = 'http://192.168.0.3:3000/product/all';
    try{
      http.Response res = await http.get(url);
      Map<String, dynamic> resBody = json.decode(res.body);
      return resBody['item'];
    }
    catch(e){
      return [];
    }
  }

  @override
  void initState() {
    Future(() async{
      productData = await this.getProduct();
      setState(() {});
      return;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => this.backBone(data: this.productData);

  Widget backBone({@required List data}) => Scaffold(
    appBar: AppBar(title: Text("구름EDU - Flutter"),),
    body: data == null
      ? Center(child: Text("Loading..."),)
      : data.isEmpty
        ? Center(child: Text("Server ERR!"),)
        : GridView.builder(
            padding: EdgeInsets.all(20.0),
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0
            ),
            itemBuilder: (BuildContext context, int index)
                => GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => new DetailPage(data: this.productData[index]))
                  ),
                  child: GridTile(
                      child: Container(
                        color: Colors.grey[200],
                        child: Center(child: Text(this.productData[index]['name'].toString()),)
                      ),
                    ),
                )
          )
  );
}
