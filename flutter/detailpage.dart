import 'package:flutter/material.dart';
import 'package:grproject/payment.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const DetailPage({@required this.data});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.data['name'].toString()),),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.data['img'] == null || widget.data['img'] == ""
                ? Text("이미지 준비중 ...")
                : Image.network(widget.data['img'].toString()),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(20.0),
                child: Text(widget.data['name'].toString())
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(20.0),
                child: Text("${widget.data['price'].toString()} 원")
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.grey[300],
                width: MediaQuery.of(context).size.width,
                child: widget.data['des'] == null
                  ? Text("설명 준비중 ...")
                  : Text(widget.data['des'].toString())
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.payments_outlined),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => new Payment(name: widget.data['name'].toString(), price: widget.data['price'].toString()))
        ),
      ),
    );
  }
}
