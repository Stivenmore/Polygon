import 'package:intl/intl.dart';

final dformat = DateFormat("MMM.d hh:mm aaa");
final dformat2 = DateFormat("yyyy/MM/dd");
final time = DateTime.now();
DateFormat form = DateFormat('yyyy-MM-dd');

timeFormat(dynamic data) {
  late String time;
  data != null
      ? time = dformat
          .format(DateTime.fromMillisecondsSinceEpoch(data.toInt()))
          .trim()
          .replaceFirst(' ', 'th')
      : time = dformat.format(DateTime.now());
  return time;
}

timeFormatGrafic(dynamic data) {
  late String time;
  data != null
      ? time = dformat2
          .format(DateTime.fromMillisecondsSinceEpoch(data.toInt()))
          .trim()
          .replaceFirst(' ', 'th')
      : time = dformat2.format(DateTime.now());
  return time;
}

timeFormatAggregates(int days) {
  final timeW = time.subtract(Duration(days: days));
  return formater(timeW);
}

formater(DateTime time) {
  final result = form.format(time);
  return result;
}
