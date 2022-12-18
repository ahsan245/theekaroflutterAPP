import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theek_karo/api/api_service.dart';
import 'package:theek_karo/models/category.dart';
import 'package:theek_karo/models/pagination.dart';

final categoriesProvider =
    FutureProvider.family<List<Category>?, PaginationModel>(
  (ref, paginationModel) {
    final apiRepository = ref.watch(apiService);

    return apiRepository.getCategories(
        paginationModel.page, paginationModel.pageSize);
  },
);
