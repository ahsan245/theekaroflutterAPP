import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theek_karo/models/pagination.dart';
import 'package:theek_karo/models/tech_filter.dart';
import 'package:flutter/material.dart';

class TechsFilterNotifier extends StateNotifier<TechFilterModel> {
  TechsFilterNotifier()
      : super(
          TechFilterModel(
            paginationModel: PaginationModel(page: 0, pageSize: 10),
          ),
        );

  void setTechFilter(TechFilterModel model) {
    state = model;
  }
}
