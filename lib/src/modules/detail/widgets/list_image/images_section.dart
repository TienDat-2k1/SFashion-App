import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/modules/detail/logic/images_section/index_image_cubit.dart';
import 'package:s_fashion/src/modules/detail/logic/images_section/index_image_state.dart';
import 'package:s_fashion/src/modules/detail/widgets/list_image/image_item.dart';

class ImagesSection extends StatelessWidget {
  const ImagesSection({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final controller = CarouselController();
    BlocProvider.of<IndexImageCubit>(context).setNewIndexImage(0);

    // Jump slide to index page
    void jumpToPageIndex(int index) {
      controller.jumpToPage(index);
    }

    // Set new index to cubit state
    void setNewCurrentIndex(int index) {
      BlocProvider.of<IndexImageCubit>(context).setNewIndexImage(index);
    }

    return SizedBox(
      width: double.infinity,
      height: 360,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) => ImageItem(
                image: images[index],
                height: double.infinity,
                width: double.infinity,
              ),
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1.0,
                autoPlay: false,
                onPageChanged: (index, reason) => setNewCurrentIndex(index),
              ),
              carouselController: controller,
            ),
          ),
          BlocBuilder<IndexImageCubit, IndexImageState>(
            builder: (context, indexState) {
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: Properties.kPaddingSmall,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: images
                        .map(
                          (image) => ImageItem(
                            image: image,
                            height: 50,
                            width: 50,
                            isCurrent:
                                images.indexOf(image) == indexState.index,
                            onSelected: () =>
                                jumpToPageIndex(images.indexOf(image)),
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
