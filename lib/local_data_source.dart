import 'package:chain_of_responsibility/data_source.dart';

class LocalDataSource extends DataSource {
  List<String> cachedData = [];

  @override
  List<String> handle() {
    if (hasData) {
      print('[LOCAL] - I DO HAVE DATA, HERE IT IS');
      return cachedData;
    } else {
      print('[LOCAL] - I DO NOT HAVE DATA, REQUESTING DOWN THE CHAIN');
      final result = super.handle();
      cachedData = result;

      print('[LOCAL] - SAVING');
    }
    return cachedData;
  }

  bool get hasData => cachedData.isNotEmpty;
}
