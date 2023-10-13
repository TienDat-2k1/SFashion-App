import 'package:equatable/equatable.dart';

abstract class EventSaleEvent extends Equatable {
  const EventSaleEvent();
}

class StartLoadEvent extends EventSaleEvent {
  const StartLoadEvent();

  @override
  List<Object?> get props => [];
}
