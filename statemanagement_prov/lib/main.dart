import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_prov/api/siswa_api.dart';
import 'package:statemanagement_prov/model/siswa_data.dart';
import 'package:statemanagement_prov/screen/demo_screen.dart';
import 'package:statemanagement_prov/screen/list_siswa_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SiswaData()),
        FutureProvider(
          create: (_) => getProfilUserName(),
          initialData: 'Loaing Name...',
        ),
        StreamProvider(
          create: (_) => getSessionTime(),
          initialData: 0,
        )
      ],
      child: MaterialApp(
        routes: {
          ListSiswaScreen.routeName: (context) => ListSiswaScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Provider Demo',
        home: DemoScreen(),
      ),
    );
  }
}
