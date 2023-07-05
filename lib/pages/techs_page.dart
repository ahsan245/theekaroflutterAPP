import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theek_karo/application/notifier/tech_notifier.dart';
import 'package:theek_karo/application/state/tech_state.dart';
import 'package:theek_karo/components/tech_card.dart';
import 'package:theek_karo/models/pagination.dart';
import 'package:theek_karo/models/tech_filter.dart';
import 'package:theek_karo/models/tech_sort.dart';
import 'package:theek_karo/providers.dart';

class TechsPage extends StatefulWidget {
  const TechsPage({super.key});

  @override
  State<TechsPage> createState() => _TechsPageState();
}

class _TechsPageState extends State<TechsPage> {
  String? categoryId;
  String? categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Technicians"),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TechFilters(
              categoryId: categoryId,
              categoryName: categoryName,
            ),
            Flexible(
              child: _TechList(),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      categoryName = arguments['categoryName'];
      categoryId = arguments['categoryId'];
    }

    super.didChangeDependencies();
  }
}

class _TechFilters extends ConsumerWidget {
  final _sortByOptions = [
    TechSortModel(value: "CreatedAt", label: "Latest"),
    TechSortModel(value: "-techPrice", label: "Price Hight to Low"),
    TechSortModel(value: "techPrice", label: "Price Low to High"),
  ];
  _TechFilters({
    Key? key,
    this.categoryName,
    this.categoryId,
  });

  final String? categoryName;
  final String? categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterProvider = ref.watch(techsFilterProvider);
    return Container(
      height: 51,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              categoryName!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: PopupMenuButton(
              onSelected: (sortBy) {
                TechFilterModel filterModel = TechFilterModel(
                    paginationModel: PaginationModel(page: 0, pageSize: 10),
                    categoryId: filterProvider.categoryId,
                    sortBy: sortBy.toString());
                ref
                    .read(techsFilterProvider.notifier)
                    .setTechFilter(filterModel);

                ref.read(techsNotifierProvider.notifier).getTechs();
              },
              initialValue: filterProvider.sortBy,
              itemBuilder: (BuildContext context) {
                return _sortByOptions.map((item) {
                  return PopupMenuItem(
                    value: item.value,
                    child: InkWell(
                      child: Text(item.label!),
                    ),
                  );
                }).toList();
              },
              icon: const Icon(Icons.filter_list_alt),
            ),
          )
        ],
      ),
    );
  }
}

class _TechList extends ConsumerWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final techsState = ref.watch(techsNotifierProvider);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        final techsViewModel = ref.read(techsNotifierProvider.notifier);
        final techsState = ref.watch(techsNotifierProvider);

        if (techsState.hasNext) {
          techsViewModel.getTechs();
        }
      }
    });
    if (techsState.techs.isEmpty) {
      if (!techsState.hasNext && !techsState.isLoading) {
        return const Center(
          child: Text("No Products"),
        );
      }
      return const LinearProgressIndicator();
    }

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(techsNotifierProvider.notifier).refreshTechs();
      },
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: GridView.count(
              crossAxisCount: 2,
              controller: _scrollController,
              children: List.generate(techsState.techs.length, (index) {
                return TechCard(
                  model: techsState.techs[index],
                );
              }),
            ),
          ),
          Visibility(
            visible: techsState.isLoading && techsState.techs.isNotEmpty,
            child: const SizedBox(
              height: 35,
              width: 35,
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
