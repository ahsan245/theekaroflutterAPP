import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theek_karo/models/pagination.dart';
part 'tech_filter.freezed.dart';

@freezed
abstract class TechFilterModel with _$TechFilterModel {
  factory TechFilterModel({
    required PaginationModel paginationModel,
    String? categoryId,
  }) = _TechFilterModel;
}
