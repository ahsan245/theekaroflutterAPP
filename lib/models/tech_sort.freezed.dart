// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tech_sort.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TechSortModel {
  String? get label => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TechSortModelCopyWith<TechSortModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechSortModelCopyWith<$Res> {
  factory $TechSortModelCopyWith(
          TechSortModel value, $Res Function(TechSortModel) then) =
      _$TechSortModelCopyWithImpl<$Res, TechSortModel>;
  @useResult
  $Res call({String? label, String? value});
}

/// @nodoc
class _$TechSortModelCopyWithImpl<$Res, $Val extends TechSortModel>
    implements $TechSortModelCopyWith<$Res> {
  _$TechSortModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TechSortModelCopyWith<$Res>
    implements $TechSortModelCopyWith<$Res> {
  factory _$$_TechSortModelCopyWith(
          _$_TechSortModel value, $Res Function(_$_TechSortModel) then) =
      __$$_TechSortModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? label, String? value});
}

/// @nodoc
class __$$_TechSortModelCopyWithImpl<$Res>
    extends _$TechSortModelCopyWithImpl<$Res, _$_TechSortModel>
    implements _$$_TechSortModelCopyWith<$Res> {
  __$$_TechSortModelCopyWithImpl(
      _$_TechSortModel _value, $Res Function(_$_TechSortModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_TechSortModel(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TechSortModel implements _TechSortModel {
  _$_TechSortModel({this.label, this.value});

  @override
  final String? label;
  @override
  final String? value;

  @override
  String toString() {
    return 'TechSortModel(label: $label, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TechSortModel &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TechSortModelCopyWith<_$_TechSortModel> get copyWith =>
      __$$_TechSortModelCopyWithImpl<_$_TechSortModel>(this, _$identity);
}

abstract class _TechSortModel implements TechSortModel {
  factory _TechSortModel({final String? label, final String? value}) =
      _$_TechSortModel;

  @override
  String? get label;
  @override
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$_TechSortModelCopyWith<_$_TechSortModel> get copyWith =>
      throw _privateConstructorUsedError;
}
