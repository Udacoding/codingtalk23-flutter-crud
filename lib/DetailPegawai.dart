import 'package:flutter/material.dart';
import 'EditPegawai.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class DetailPegawai extends StatefulWidget {
  List list;
  int index;

  DetailPegawai({this.list, this.index});

  @override
  _DetailPegawaiState createState() => _DetailPegawaiState();
}

class _DetailPegawaiState extends State<DetailPegawai> {
  void hapusData() {
    var url = "http://172.20.10.13/PegawaiServer/hapusPegawai.php";
    http.post(url, body: {"id": widget.list[widget.index]['id']});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ' + widget.list[widget.index]['namaPegawai']),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditPegawai(
                            list: widget.list, index: widget.index)));
              }),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                hapusData();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.list[widget.index]['namaPegawai'],
              style: TextStyle(fontSize: 30.0),
            ),
            Text(widget.list[widget.index]['alamat']),
            Text(widget.list[widget.index]['gaji']),
          ],
        ),
      ),
    );
  }
}
