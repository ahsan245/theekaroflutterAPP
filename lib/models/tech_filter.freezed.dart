// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tech_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TechFilterModel {
  PaginationModel get paginationModel => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String? get sortBy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TechFilterModelCopyWith<TechFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechFilterModelCopyWith<$Res> {
  factory $TechFilterModelCopyWith(
          TechFilterModel value, $Res Function(TechFilterModel) then) =
      _$TechFilterModelCopyWithImpl<$Res, TechFilterModel>;
  @useResult
  $Res call(
      {PaginationModel paginationModel, String? categoryId, String? sortBy});

  $PaginationModelCopyWith<$Res> get paginationModel;
}

/// @nodoc
class _$TechFilterModelCopyWithImpl<$Res, $Val extends TechFilterModel>
    implements $TechFilterModelCopyWith<$Res> {
  _$TechFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginationModel = null,
    Object? categoryId = freezed,
    Object? sortBy = freezed,
  }) {
    return _then(_value.copyWith(
      paginationModel: null == paginationModel
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as PaginationModel,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationModelCopyWith<$Res> get paginationModel {
    return $PaginationModelCopyWith<$Res>(_value.paginationModel, (value) {
      return _then(_value.copyWith(paginationModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TechFilterModelCopyWith<$Res>
    implements $TechFilterModelCopyWith<$Res> {
  factory _$$_TechFilterModelCopyWith(
          _$_TechFilterModel value, $Res Function(_$_TechFilterModel) then) =
      __$$_TechFilterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaginationModel paginationModel, String? categoryId, String? sortBy});

  @override
  $PaginationModelCopyWith<$Res> get paginationModel;
}

/// @nodoc
class __$$_TechFilterModelCopyWithImpl<$Res>
    extends _$TechFilterModelCopyWithImpl<$Res, _$_TechFilterModel>
    implements _$$_TechFilterModelCopyWith<$Res> {
  __$$_TechFilterModelCopyWithImpl(
      _$_TechFilterModel _value, $Res Function(_$_TechFilterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginationModel = null,
    Object? categoryId = freezed,
    Object? sortBy = freezed,
  }) {
    return _then(_$_TechFilterModel(
      paginationModel: null == paginationModel
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as PaginationModel,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TechFilterModel implements _TechFilterModel {
  _$_TechFilterModel(
      {required this.paginationModel, this.categoryId, this.sortBy});

  @override
  final PaginationModel paginationModel;
  @override
  final String? categoryId;
  @override
  final String? sortBy;

  @override
  String toString() {
    return 'TechFilterModel(paginationModel: $paginationModel, categoryId: $categoryId, sortBy: $sortBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TechFilterModel &&
            (identical(other.paginationModel, paginationModel) ||
                other.paginationModel == paginationModel) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, paginationModel, categoryId, sortBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TechFilterModelCopyWith<_$_TechFilterModel> get copyWith =>
      __$$_TechFilterModelCopyWithImpl<_$_TechFilterModel>(this, _$identity);
}

abstract class _TechFilterModel implements TechFilterModel {
  factory _TechFilterModel(
      {required final PaginationModel paginationModel,
      final String? categoryId,
      final String? sortBy}) = _$_TechFilterModel;

  @override
  PaginationModel get paginationModel;
  @override
  String? get categoryId;
  @override
  String? get sortBy;
  @override
  @JsonKey(ignore: true)
  _$$_TechFilterModelCopyWith<_$_TechFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
