import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/modules/products/logic/event/event_sale_event.dart';
import 'package:s_fashion/src/modules/products/logic/event/event_sale_state.dart';
import 'package:s_fashion/src/repositories/event_sale_query/event_sale_query.dart';

class EventSaleBloc extends Bloc<EventSaleEvent, EventSaleState> {
  EventSaleBloc() : super(const InitState()) {
    on<StartLoadEvent>(
      (event, emit) async {
        emit(const LoadingEventState());
        final reponse = await EventSaleQuery.readDummyJson();

        if (reponse.error != null) {
          emit(ErrorEventState(reponse));
        } else {
          emit(LoadedEventState(reponse));
        }
      },
    );
  }
}
