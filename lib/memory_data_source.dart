import 'package:chain_of_responsibility/data_source.dart';

class MemoryDataSource extends DataSource {
  List<String> cachedData = [];

  @override
  List<String> handle() {
    if (hasData) {
      print('[MEMORY] - I DO HAVE DATA, HERE IT IS');
      return cachedData;
    } else {
      print('[MEMORY] - I DO NOT HAVE DATA, REQUESTING DOWN THE CHAIN');
      final result = super.handle();
      cachedData = result;

      print('[MEMORY] - SAVING');
    }
    return cachedData;
  }

  bool get hasData => cachedData.isNotEmpty;

  void clear() {
    cachedData = [];
    print('[MEMORY] - CLEARING DATA, SIMULATION');
  }
}
