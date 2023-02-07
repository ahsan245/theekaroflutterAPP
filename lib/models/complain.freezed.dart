// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Complain _$ComplainFromJson(Map<String, dynamic> json) {
  return _Complain.fromJson(json);
}

/// @nodoc
mixin _$Complain {
  String get complainName => throw _privateConstructorUsedError;
  String get complainDescription => throw _privateConstructorUsedError;
  String get userAddress => throw _privateConstructorUsedError;
  String get complainCategory => throw _privateConstructorUsedError;
  bool get complainStatus => throw _privateConstructorUsedError;
  String get complainId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComplainCopyWith<Complain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplainCopyWith<$Res> {
  factory $ComplainCopyWith(Complain value, $Res Function(Complain) then) =
      _$ComplainCopyWithImpl<$Res, Complain>;
  @useResult
  $Res call(
      {String complainName,
      String complainDescription,
      String userAddress,
      String complainCategory,
      bool complainStatus,
      String complainId});
}

/// @nodoc
class _$ComplainCopyWithImpl<$Res, $Val extends Complain>
    implements $ComplainCopyWith<$Res> {
  _$ComplainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complainName = null,
    Object? complainDescription = null,
    Object? userAddress = null,
    Object? complainCategory = null,
    Object? complainStatus = null,
    Object? complainId = null,
  }) {
    return _then(_value.copyWith(
      complainName: null == complainName
          ? _value.complainName
          : complainName // ignore: cast_nullable_to_non_nullable
              as String,
      complainDescription: null == complainDescription
          ? _value.complainDescription
          : complainDescription // ignore: cast_nullable_to_non_nullable
              as String,
      userAddress: null == userAddress
          ? _value.userAddress
          : userAddress // ignore: cast_nullable_to_non_nullable
              as String,
      complainCategory: null == complainCategory
          ? _value.complainCategory
          : complainCategory // ignore: cast_nullable_to_non_nullable
              as String,
      complainStatus: null == complainStatus
          ? _value.complainStatus
          : complainStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      complainId: null == complainId
          ? _value.complainId
          : complainId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ComplainCopyWith<$Res> implements $ComplainCopyWith<$Res> {
  factory _$$_ComplainCopyWith(
          _$_Complain value, $Res Function(_$_Complain) then) =
      __$$_ComplainCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String complainName,
      String complainDescription,
      String userAddress,
      String complainCategory,
      bool complainStatus,
      String complainId});
}

/// @nodoc
class __$$_ComplainCopyWithImpl<$Res>
    extends _$ComplainCopyWithImpl<$Res, _$_Complain>
    implements _$$_ComplainCopyWith<$Res> {
  __$$_ComplainCopyWithImpl(
      _$_Complain _value, $Res Function(_$_Complain) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? complainName = null,
    Object? complainDescription = null,
    Object? userAddress = null,
    Object? complainCategory = null,
    Object? complainStatus = null,
    Object? complainId = null,
  }) {
    return _then(_$_Complain(
      complainName: null == complainName
          ? _value.complainName
          : complainName // ignore: cast_nullable_to_non_nullable
              as String,
      complainDescription: null == complainDescription
          ? _value.complainDescription
          : complainDescription // ignore: cast_nullable_to_non_nullable
              as String,
      userAddress: null == userAddress
          ? _value.userAddress
          : userAddress // ignore: cast_nullable_to_non_nullable
              as String,
      complainCategory: null == complainCategory
          ? _value.complainCategory
          : complainCategory // ignore: cast_nullable_to_non_nullable
              as String,
      complainStatus: null == complainStatus
          ? _value.complainStatus
          : complainStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      complainId: null == complainId
          ? _value.complainId
          : complainId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Complain implements _Complain {
  _$_Complain(
      {required this.complainName,
      required this.complainDescription,
      required this.userAddress,
      required this.complainCategory,
      required this.complainStatus,
      required this.complainId});

  factory _$_Complain.fromJson(Map<String, dynamic> json) =>
      _$$_ComplainFromJson(json);

  @override
  final String complainName;
  @override
  final String complainDescription;
  @override
  final String userAddress;
  @override
  final String complainCategory;
  @override
  final bool complainStatus;
  @override
  final String complainId;

  @override
  String toString() {
    return 'Complain(complainName: $complainName, complainDescription: $complainDescription, userAddress: $userAddress, complainCategory: $complainCategory, complainStatus: $complainStatus, complainId: $complainId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Complain &&
            (identical(other.complainName, complainName) ||
                other.complainName == complainName) &&
            (identical(other.complainDescription, complainDescription) ||
                other.complainDescription == complainDescription) &&
            (identical(other.userAddress, userAddress) ||
                other.userAddress == userAddress) &&
            (identical(other.complainCategory, complainCategory) ||
                other.complainCategory == complainCategory) &&
            (identical(other.complainStatus, complainStatus) ||
                other.complainStatus == complainStatus) &&
            (identical(other.complainId, complainId) ||
                other.complainId == complainId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      complainName,
      complainDescription,
      userAddress,
      complainCategory,
      complainStatus,
      complainId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComplainCopyWith<_$_Complain> get copyWith =>
      __$$_ComplainCopyWithImpl<_$_Complain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComplainToJson(
      this,
    );
  }
}

abstract class _Complain implements Complain {
  factory _Complain(
      {required final String complainName,
      required final String complainDescription,
      required final String userAddress,
      required final String complainCategory,
      required final bool complainStatus,
      required final String complainId}) = _$_Complain;

  factory _Complain.fromJson(Map<String, dynamic> json) = _$_Complain.fromJson;

  @override
  String get complainName;
  @override
  String get complainDescription;
  @override
  String get userAddress;
  @override
  String get complainCategory;
  @override
  bool get complainStatus;
  @override
  String get complainId;
  @override
  @JsonKey(ignore: true)
  _$$_ComplainCopyWith<_$_Complain> get copyWith =>
      throw _privateConstructorUsedError;
}