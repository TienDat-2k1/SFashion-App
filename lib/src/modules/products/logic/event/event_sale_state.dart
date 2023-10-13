import 'package:equatable/equatable.dart';
import 'package:s_fashion/src/models/event_sale_reponse.dart';

abstract class EventSaleState extends Equatable {
  final EventSaleReponse? reponse;

  const EventSaleState({this.reponse});
}

class LoadingEventState extends EventSaleState {
  const LoadingEventState() : super(reponse: null);

  @override
  List<Object?> get props => [reponse];
}

class LoadedEventState extends EventSaleState {
  const LoadedEventState(EventSaleReponse reponse) : super(reponse: reponse);

  @override
  List<Object?> get props => [reponse];
}

class ErrorEventState extends EventSaleState {
  final String mesError;

  ErrorEventState(
    EventSaleReponse reponse,
  )   : mesError = reponse.error!,
        super(reponse: reponse);

  @override
  List<Object?> get props => [reponse];
}

class InitState extends EventSaleState {
  const InitState() : super(reponse: null);

  @override
  List<Object?> get props => [reponse];
}
