import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theek_karo/models/pagination.dart';
part 'tech_sort.freezed.dart';

@freezed
class TechSortModel with _$TechSortModel {
  factory TechSortModel({
    String? label,
    String? value,
  }) = _TechSortModel;
}
