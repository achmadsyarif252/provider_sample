import 'package:intl/intl.dart';

Future<String> getProfilUserName() async {
  await Future.delayed(Duration(seconds: 5));

  return 'Achmad Syarif';
}

Future<String> getCurrentTime() async {
  await Future.delayed(Duration(seconds: 5));
  return DateFormat('hh:mm:aa').format(DateTime.now());
}

Stream<int> getSessionTime() {
  return Stream.periodic(
    Duration(seconds: 1),
    (sessionTime) => sessionTime++,
  );
}
