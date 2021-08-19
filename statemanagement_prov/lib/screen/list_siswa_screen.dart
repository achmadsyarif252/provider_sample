import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_prov/model/siswa.dart';
import 'package:statemanagement_prov/model/siswa_data.dart';

class ListSiswaScreen extends StatelessWidget {
  static const routeName = '/siswascreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siswa'),
      ),
      body: Consumer<SiswaData>(
        builder: (context, mhsData, _) => ListView.builder(
          itemBuilder: (context, i) {
            final mhsData2 = mhsData.mhs[i];
            return Column(
              children: [
                ListTile(
                  leading: Text('${i + 1}'),
                  title: Text(mhsData2.nama),
                  subtitle: Text(mhsData2.city),
                  trailing: IconButton(
                    onPressed: () {
                      mhsData.deleteMhs(mhsData2);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
                Divider()
              ],
            );
          },
          // itemCount: context.watch<SiswaData>().mhs.length :ini versi ke 2
          itemCount: mhsData.mhsCount, //Versi yang ane suka
        ),
      ),
    );
  }
}
