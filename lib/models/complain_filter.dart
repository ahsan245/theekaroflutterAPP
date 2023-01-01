import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theek_karo/models/pagination.dart';

part 'complain_filter.freezed.dart';

@freezed
abstract class ComplainFilterModel with _$ComplainFilterModel {
  factory ComplainFilterModel({
    required PaginationModel paginationModel,
    String userId,
    List<String>? complainId,
  }) = _ComplainFilterModel;
}
