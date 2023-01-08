import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theek_karo/models/pagination.dart';
import 'package:theek_karo/models/slider.dart';
import 'package:theek_karo/providers.dart';

class HomeSliderWidget extends ConsumerWidget {
  const HomeSliderWidget({Key? key}) : super(key: key);

  Widget _sliderList(WidgetRef ref) {
    final sliders = ref.watch(
      slidersProvider(
        PaginationModel(
          page: 1,
          pageSize: 10,
        ),
      ),
    );

    return sliders.when(
      data: (list) {
        return imageCarousel(list!);
      },
      error: (_, __) => const Center(
        child: Text("ERR"),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget imageCarousel(
    List<SliderModel> sliderList,
  ) {
    return CarouselSlider(
        items: sliderList.map((model) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(model.fullImagePath),
                fit: BoxFit.contain,
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 19,
          autoPlayCurve: Curves.decelerate,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: _sliderList(ref),
      height: 200,
    );
  }
}
