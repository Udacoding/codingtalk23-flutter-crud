import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class AddPegawai extends StatefulWidget {
  @override
  _AddPegawaiState createState() => _AddPegawaiState();
}

class _AddPegawaiState extends State<AddPegawai> {
  TextEditingController namaController = new TextEditingController();
  TextEditingController alamatController = new TextEditingController();
  TextEditingController gajiController = new TextEditingController();

  void AddData() {
    var url = "http://172.20.10.13/PegawaiServer/AddPegawai.php";
    http.post(url, body: {
      "namaPegawai": namaController.text,
      "alamat": alamatController.text,
      "gaji": gajiController.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Pegawai',
          style: TextStyle(
              fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
              controller: alamatController,
              maxLines: 2,
              decoration: InputDecoration(
                  hintText: 'input alamat',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'tolong isi';
                } else {
                  return null;
                }
              },
              controller: gajiController,
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
                child: Text('SIMPAN'),
                onPressed: () {
                  AddData();
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                }),
          )
        ],
      ),
    );
  }
}
