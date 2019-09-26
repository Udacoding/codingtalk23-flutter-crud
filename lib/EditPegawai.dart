import 'package:flutter/material.dart';
import 'main.dart';
import 'DetailPegawai.dart';
import 'package:http/http.dart' as http;

class EditPegawai extends StatefulWidget {
  List list;
  int index;

  EditPegawai({this.list, this.index});

  @override
  _EditPegawaiState createState() => _EditPegawaiState();
}

class _EditPegawaiState extends State<EditPegawai> {
  TextEditingController namaController, gaji, alamat;

  void EditData() {
    var url = "http://172.20.10.13/PegawaiServer/EditPegawai.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "namaPegawai": namaController.text,
      "gaji": gaji.text,
      "alamat": alamat.text
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    namaController =
        TextEditingController(text: widget.list[widget.index]['namaPegawai']);
    gaji = TextEditingController(text: widget.list[widget.index]['gaji']);
    alamat = TextEditingController(text: widget.list[widget.index]['alamat']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Pegawai'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: namaController,
              decoration: InputDecoration(
                  hintText: 'input nama',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: alamat,
              maxLines: 2,
              decoration: InputDecoration(
                  hintText: 'input alamat',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: gaji,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'input gaji',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.blue,
                child: Text('UPDATE'),
                onPressed: () {
                  EditData();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                }),
          )
        ],
      ),
    );
  }
}
