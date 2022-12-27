import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theek_karo/models/pagination.dart';
part 'user_filter.freezed.dart';

@freezed
abstract class UserFilterModel with _$UserFilterModel {
  factory UserFilterModel({
    required PaginationModel paginationModel,
    List<String>? userId,
  }) = _UserFilterModel;
}
