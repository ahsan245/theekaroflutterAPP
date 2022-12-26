import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theek_karo/components/tech_card.dart';
import 'package:theek_karo/models/pagination.dart';
import 'package:theek_karo/models/tech.dart';
import 'package:theek_karo/models/tech_filter.dart';
import 'package:theek_karo/providers.dart';

class RelatedTechsWidget extends ConsumerWidget {
  const RelatedTechsWidget(this.relatedTechs, {Key? key}) : super(key: key);
  final List<String> relatedTechs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          Text(
            "Related Techs",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Visibility(
            child: _techList(ref),
            visible: relatedTechs.isNotEmpty,
          )
        ],
      ),
    );
  }

  Widget _techList(WidgetRef ref) {
    final techs = ref.watch(
      relatedTechsProvider(
        TechFilterModel(
          paginationModel: PaginationModel(page: 1, pageSize: 10),
        ),
      ),
    );
    return techs.when(
      data: (list) {
        return _buildTechList(list!);
      },
      error: (_, __) => const Center(
        child: Text("Error"),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildTechList(List<Tech> techs) {
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: techs.length,
        itemBuilder: (context, index) {
          var data = techs[index];
          return GestureDetector(
            onTap: () {},
            child: TechCard(
              model: data,
            ),
          );
        },
      ),
    );
  }
}
