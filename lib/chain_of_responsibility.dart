import 'package:chain_of_responsibility/local_data_source.dart';
import 'package:chain_of_responsibility/memory_data_source.dart';
import 'package:chain_of_responsibility/remote_data_source.dart';

void run() {
  final remote = RemoteDataSource();
  final local = LocalDataSource();
  final memory = MemoryDataSource();
  memory.linkWith(local).linkWith(remote);

  print('============================================');
  print('[COR] - STARTING THE CHAIN');
  print('[COR RESULT] => ${memory.handle()}');
  print('[COR] - END OF THE CHAIN');
  print('============================================');
  print('\n');

  print('============================================');
  print('[COR] - STARTING THE CHAIN');
  print('[COR RESULT] => ${memory.handle()}');
  print('[COR] - END OF THE CHAIN');
  print('============================================');

  print('\n');
  print('============================================');
  memory.clear();
  print('============================================');
  print('\n');

  print('============================================');
  print('[COR] - STARTING THE CHAIN');
  print('[COR RESULT] => ${memory.handle()}');
  print('[COR] - END OF THE CHAIN');
  print('============================================');
  print('\n');

  print('============================================');
  print('[COR] - STARTING THE CHAIN');
  print('[COR RESULT] => ${memory.handle()}');
  print('[COR] - END OF THE CHAIN');
  print('============================================');
  print('\n');
}
