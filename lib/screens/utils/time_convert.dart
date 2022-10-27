import 'package:intl/intl.dart';

final dformat = DateFormat("MMM.d hh:mm aaa");

timeFormat(dynamic data) {
  late String time;
  data != null
      ? time = dformat
          .format(DateTime.fromMillisecondsSinceEpoch(data))
          .trim()
          .replaceFirst(' ', 'th')
      : time = dformat.format(DateTime.now());
  return time;
}
