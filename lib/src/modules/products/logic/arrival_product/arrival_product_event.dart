import 'package:equatable/equatable.dart';

abstract class ArrivalProductEvent extends Equatable {
  const ArrivalProductEvent();
}

class LoadArrivalProducEvent extends ArrivalProductEvent {
  const LoadArrivalProducEvent();

  @override
  List<Object?> get props => [];
}
