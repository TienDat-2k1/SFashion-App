import 'package:equatable/equatable.dart';

abstract class TrendProductEvent extends Equatable {
  const TrendProductEvent();
}

class LoadTrendProducEvent extends TrendProductEvent {
  const LoadTrendProducEvent();

  @override
  List<Object?> get props => [];
}
