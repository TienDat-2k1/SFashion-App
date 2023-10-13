import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:s_fashion/src/constants/my_dummies.dart';
import 'package:s_fashion/src/models/event_sale_reponse.dart';

final logger = Logger();

class EventSaleQuery {
  static Future<EventSaleReponse> readDummyJson() async {
    try {
      // Read file json
      final String response = await rootBundle.loadString(MyDummies.eventSales);
      final Map<String, dynamic> data = await json.decode(response);
      final listData = data['events'] as List;

      if (listData.isNotEmpty) {
        //logger.i(listData.toString());
        return EventSaleReponse.fromJSON(listData);
      } else {
        //logger.i('Empty events');
        return EventSaleReponse.error('Empty events');
      }
    } catch (e) {
      //logger.e(e.toString());
      return EventSaleReponse.error('Empty events');
    }
  }
}
