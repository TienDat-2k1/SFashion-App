import 'package:equatable/equatable.dart';

abstract class HotProductEvent extends Equatable {
  const HotProductEvent();
}

class LoadHotProducEvent extends HotProductEvent {
  const LoadHotProducEvent();

  @override
  List<Object?> get props => [];
}
