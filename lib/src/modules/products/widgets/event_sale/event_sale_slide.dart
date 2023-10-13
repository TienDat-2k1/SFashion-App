import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:s_fashion/src/models/event_sale.dart';
import 'package:s_fashion/src/modules/products/widgets/event_sale/event_sale_item.dart';

class EventSaleSlide extends StatelessWidget {
  const EventSaleSlide({
    super.key,
    required this.events,
  });

  final List<EventSale> events;

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final double heightItem = widthDevice >= 700 ? 400 : 260;

    return CarouselSlider(
      items: events.map((event) => EventSaleItem(event: event)).toList(),
      options: CarouselOptions(
        height: heightItem,
        autoPlay: true,
        viewportFraction: 1.0,
      ),
    );
  }
}
