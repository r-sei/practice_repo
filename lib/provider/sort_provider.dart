import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SortType {
  title,
  date,
  category,
}

final sortTypeProvider =
    StateProvider<SortType>((ref) => SortType.date); //デフォルト：日付順
final isAscendingProvider = StateProvider<bool>((ref) => true); //デフォルト：昇順
