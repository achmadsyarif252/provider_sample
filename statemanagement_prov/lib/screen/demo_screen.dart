import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_prov/api/siswa_api.dart';
import 'package:statemanagement_prov/model/siswa.dart';
import 'package:statemanagement_prov/model/siswa_data.dart';
import 'package:statemanagement_prov/screen/list_siswa_screen.dart';

class DemoScreen extends StatelessWidget {
  final TextEditingController naamController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.watch<String>(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureProvider(
              create: (context) => getCurrentTime(),
              initialData: 'Loading Time',
              child: Consumer<String>(
                builder: (_, timeString, __) => Center(
                    child: Text(
                  timeString,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                )),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: naamController,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                hintText: 'City',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatButton(
                    height: 50.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () {
                      // Provider.of<SiswaData>(context, listen: false).addMhs(
                      //   naamController.text,
                      //   cityController.text,
                      // ); versi 1
                      context.read<SiswaData>().addMhs(
                            naamController.text,
                            cityController.text,
                          );
                      naamController.clear();
                      cityController.clear();
                    },
                    child: Text('Add'),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    height: 50.0,
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ListSiswaScreen.routeName);
                    },
                    child: Text('List'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                child: Consumer<SiswaData>(
                  builder: (context, dataMhs, _) => ListView.builder(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    itemBuilder: (context, i) {
                      final dataMhs2 = dataMhs.mhs[i];
                      return Card(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: ListTile(
                          title: Text(dataMhs2.nama),
                          subtitle: Text(dataMhs2.city),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Delete'),
                                  content: Text('Delete Mhs ?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('No'),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Provider.of<SiswaData>(context,
                                                  listen: false)
                                              .deleteMhs(dataMhs2);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Yes'))
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    itemCount: dataMhs.mhsCount,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
