import 'package:get_it/get_it.dart';

final sharedLocator = GetIt.instance;

Future<void> initSharedLocator() async {
  await _initSharedDependencies();
}

Future<void> _initSharedDependencies() async {
  
}