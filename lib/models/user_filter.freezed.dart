// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserFilterModel {
  PaginationModel get paginationModel => throw _privateConstructorUsedError;
  List<String>? get userId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserFilterModelCopyWith<UserFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFilterModelCopyWith<$Res> {
  factory $UserFilterModelCopyWith(
          UserFilterModel value, $Res Function(UserFilterModel) then) =
      _$UserFilterModelCopyWithImpl<$Res, UserFilterModel>;
  @useResult
  $Res call({PaginationModel paginationModel, List<String>? userId});

  $PaginationModelCopyWith<$Res> get paginationModel;
}

/// @nodoc
class _$UserFilterModelCopyWithImpl<$Res, $Val extends UserFilterModel>
    implements $UserFilterModelCopyWith<$Res> {
  _$UserFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginationModel = null,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      paginationModel: null == paginationModel
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as PaginationModel,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
abstract class _$$_UserFilterModelCopyWith<$Res>
    implements $UserFilterModelCopyWith<$Res> {
  factory _$$_UserFilterModelCopyWith(
          _$_UserFilterModel value, $Res Function(_$_UserFilterModel) then) =
      __$$_UserFilterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaginationModel paginationModel, List<String>? userId});

  @override
  $PaginationModelCopyWith<$Res> get paginationModel;
}

/// @nodoc
class __$$_UserFilterModelCopyWithImpl<$Res>
    extends _$UserFilterModelCopyWithImpl<$Res, _$_UserFilterModel>
    implements _$$_UserFilterModelCopyWith<$Res> {
  __$$_UserFilterModelCopyWithImpl(
      _$_UserFilterModel _value, $Res Function(_$_UserFilterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginationModel = null,
    Object? userId = freezed,
  }) {
    return _then(_$_UserFilterModel(
      paginationModel: null == paginationModel
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as PaginationModel,
      userId: freezed == userId
          ? _value._userId
          : userId // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$_UserFilterModel implements _UserFilterModel {
  _$_UserFilterModel(
      {required this.paginationModel, final List<String>? userId})
      : _userId = userId;

  @override
  final PaginationModel paginationModel;
  final List<String>? _userId;
  @override
  List<String>? get userId {
    final value = _userId;
    if (value == null) return null;
    if (_userId is EqualUnmodifiableListView) return _userId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserFilterModel(paginationModel: $paginationModel, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserFilterModel &&
            (identical(other.paginationModel, paginationModel) ||
                other.paginationModel == paginationModel) &&
            const DeepCollectionEquality().equals(other._userId, _userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paginationModel,
      const DeepCollectionEquality().hash(_userId));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserFilterModelCopyWith<_$_UserFilterModel> get copyWith =>
      __$$_UserFilterModelCopyWithImpl<_$_UserFilterModel>(this, _$identity);
}

abstract class _UserFilterModel implements UserFilterModel {
  factory _UserFilterModel(
      {required final PaginationModel paginationModel,
      final List<String>? userId}) = _$_UserFilterModel;

  @override
  PaginationModel get paginationModel;
  @override
  List<String>? get userId;
  @override
  @JsonKey(ignore: true)
  _$$_UserFilterModelCopyWith<_$_UserFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
