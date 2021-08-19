import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:statemanagement_prov/model/siswa.dart';

class SiswaData extends ChangeNotifier {
  List<Siswa> _dataMhs = [
    Siswa('Achmad Syarif', 'Tegal'),
  ];

  UnmodifiableListView<Siswa> get mhs {
    return UnmodifiableListView(_dataMhs);
  }

  int get mhsCount {
    return _dataMhs.length;
  }

  void addMhs(String nama, String city) {
    final newMhs = Siswa(nama, city);
    if (nama.isNotEmpty && city.isNotEmpty) _dataMhs.add(newMhs);
    notifyListeners();
  }

  void deleteMhs(Siswa siswa) {
    _dataMhs.remove(siswa);
    notifyListeners();
  }
}
