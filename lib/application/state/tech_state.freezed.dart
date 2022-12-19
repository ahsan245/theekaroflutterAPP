// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tech_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TechsState {
  List<Tech> get techs => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TechsStateCopyWith<TechsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechsStateCopyWith<$Res> {
  factory $TechsStateCopyWith(
          TechsState value, $Res Function(TechsState) then) =
      _$TechsStateCopyWithImpl<$Res, TechsState>;
  @useResult
  $Res call({List<Tech> techs, bool hasNext, bool isLoading});
}

/// @nodoc
class _$TechsStateCopyWithImpl<$Res, $Val extends TechsState>
    implements $TechsStateCopyWith<$Res> {
  _$TechsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? techs = null,
    Object? hasNext = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      techs: null == techs
          ? _value.techs
          : techs // ignore: cast_nullable_to_non_nullable
              as List<Tech>,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TechsStateCopyWith<$Res>
    implements $TechsStateCopyWith<$Res> {
  factory _$$_TechsStateCopyWith(
          _$_TechsState value, $Res Function(_$_TechsState) then) =
      __$$_TechsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Tech> techs, bool hasNext, bool isLoading});
}

/// @nodoc
class __$$_TechsStateCopyWithImpl<$Res>
    extends _$TechsStateCopyWithImpl<$Res, _$_TechsState>
    implements _$$_TechsStateCopyWith<$Res> {
  __$$_TechsStateCopyWithImpl(
      _$_TechsState _value, $Res Function(_$_TechsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? techs = null,
    Object? hasNext = null,
    Object? isLoading = null,
  }) {
    return _then(_$_TechsState(
      techs: null == techs
          ? _value._techs
          : techs // ignore: cast_nullable_to_non_nullable
              as List<Tech>,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TechsState implements _TechsState {
  const _$_TechsState(
      {final List<Tech> techs = const <Tech>[],
      this.hasNext = true,
      this.isLoading = false})
      : _techs = techs;

  final List<Tech> _techs;
  @override
  @JsonKey()
  List<Tech> get techs {
    if (_techs is EqualUnmodifiableListView) return _techs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_techs);
  }

  @override
  @JsonKey()
  final bool hasNext;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'TechsState(techs: $techs, hasNext: $hasNext, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TechsState &&
            const DeepCollectionEquality().equals(other._techs, _techs) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_techs), hasNext, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TechsStateCopyWith<_$_TechsState> get copyWith =>
      __$$_TechsStateCopyWithImpl<_$_TechsState>(this, _$identity);
}

abstract class _TechsState implements TechsState {
  const factory _TechsState(
      {final List<Tech> techs,
      final bool hasNext,
      final bool isLoading}) = _$_TechsState;

  @override
  List<Tech> get techs;
  @override
  bool get hasNext;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_TechsStateCopyWith<_$_TechsState> get copyWith =>
      throw _privateConstructorUsedError;
}
