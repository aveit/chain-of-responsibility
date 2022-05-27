import 'package:chain_of_responsibility/data_source.dart';

class RemoteDataSource extends DataSource {
  @override
  List<String> handle() {
    print('[REMOTE] - FETCHING DATA');
    return ['User1', 'User2', 'User3'];
  }
}
