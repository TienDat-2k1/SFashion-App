import 'package:s_fashion/src/models/event_sale.dart';

class EventSaleReponse {
  final List<EventSale>? events;
  final String? error;

  const EventSaleReponse({this.events, this.error});

  EventSaleReponse.fromJSON(List<dynamic> data)
      : events = data
            .map(
              (eventMap) => EventSale.fromJson(
                eventMap as Map<String, dynamic>,
              ),
            )
            .toList(),
        error = null;

  EventSaleReponse.error(String mesError)
      : events = null,
        error = mesError;
}
