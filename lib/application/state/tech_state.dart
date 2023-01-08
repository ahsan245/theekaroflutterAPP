import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theek_karo/models/tech.dart';

part 'tech_state.freezed.dart';

@freezed
class TechsState with _$TechsState {
  const factory TechsState(
      {@Default(<Tech>[]) List<Tech> techs,
      @Default(true) bool hasNext,
      @Default(false) bool isLoading}) = _TechsState;
}
