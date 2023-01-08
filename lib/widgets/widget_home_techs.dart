import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theek_karo/components/tech_card.dart';
import 'package:theek_karo/models/category.dart';
import 'package:theek_karo/models/pagination.dart';
import 'package:theek_karo/models/tech.dart';
import 'package:theek_karo/models/tech_filter.dart';
import 'package:theek_karo/providers.dart';

class HomeTechsWidget extends ConsumerWidget {
  const HomeTechsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //List<Tech> list = List<Tech>.empty(growable: true);

    // list.add(Tech(
    //     techName: "Britannia Ahsan",
    //     category: Category(
    //         categoryName: "Hardware",
    //         categoryImage: "/uploads/categories/1642279565619-biscuits.png",
    //         categoryId: "61e338d5537e82b17a8bf42"),
    //     techShortDescription: "This is a well certified Tech",
    //     techPrice: 30,
    //     techSalePrice: 26,
    //     techImage: "/uploads/technicians/1642279565619-biscuits.png",
    //     techType: "Hardware",
    //     techStatus: "IN",
    //     techId: "61eb0f36c1c5d2c5893e1ac"));

    // list.add(Tech(
    //     techName: "Britannia Ahsan",
    //     category: Category(
    //         categoryName: "Hardware",
    //         categoryImage: "/uploads/categories/1642279565619-biscuits.png",
    //         categoryId: "61e338d5537e82b17a8bf42"),
    //     techShortDescription: "This is a well certified Tech",
    //     techPrice: 30,
    //     techSalePrice: 26,
    //     techImage: "/uploads/technicians/1642279565619-biscuits.png",
    //     techType: "Hardware",
    //     techStatus: "IN",
    //     techId: "61eb0f36c1c5d2c5893e1ac"));
    return Container(
      color: const Color(0xffF4F7FA),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 15),
              child: Text(
                "Top 10 Technicians",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: _techsList(ref),
        )
      ]),
    );
  }

  Widget _techsList(WidgetRef ref) {
    final techs = ref.watch(
      homeTechProvider(
        TechFilterModel(
          paginationModel: PaginationModel(page: 1, pageSize: 10),
        ),
      ),
    );

    return techs.when(
      data: (list) {
        return _buildTechList(list!);
      },
      error: (_, __) {
        return const Center(child: Text("ERROR"));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildTechList(List<Tech> techs) {
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: techs.length,
        itemBuilder: ((context, index) {
          var data = techs[index];
          return GestureDetector(
            onTap: () {},
            child: TechCard(
              model: data,
            ),
          );
        }),
      ),
    );
  }
}
