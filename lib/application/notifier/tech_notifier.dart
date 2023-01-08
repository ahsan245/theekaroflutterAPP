import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theek_karo/api/api_service.dart';
import 'package:theek_karo/application/state/tech_state.dart';
import 'package:theek_karo/models/pagination.dart';
import 'package:theek_karo/models/tech_filter.dart';

class TechNotifier extends StateNotifier<TechsState> {
  final APIService _apiService;
  final TechFilterModel _filterModel;

  TechNotifier(this._apiService, this._filterModel) : super(const TechsState());

  int _page = 1;

  Future<void> getTechs() async {
    if (state.isLoading || !state.hasNext) {
      return;
    }

    state = state.copyWith(isLoading: true);
    var filterModel = _filterModel.copyWith(
      paginationModel: PaginationModel(
        page: _page,
        pageSize: 10,
      ),
    );

    final techs = await _apiService.getTechs(filterModel);
    final newTechs = [...state.techs, ...techs!];

    if (techs.length % 10 != 0 || techs.isEmpty) {
      state = state.copyWith(hasNext: false);
    }

    Future.delayed(const Duration(milliseconds: 1500), () {
      state = state.copyWith(techs: newTechs);

      _page++;

      state = state.copyWith(isLoading: false);
    });
  }

  Future<void> refreshTechs() async {
    state = state.copyWith(techs: [], hasNext: true);

    _page = 1;
    await getTechs();
  }
}
