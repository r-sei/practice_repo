import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider = StateProvider<String>((red) {
  return 'dd/mm/yy';
});

final timeProvider = StateProvider<String>((red) {
  return 'hh : mm';
});
