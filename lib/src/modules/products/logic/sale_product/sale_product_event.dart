import 'package:equatable/equatable.dart';

abstract class HotProductEvent extends Equatable {
  const HotProductEvent();
}

class LoadSaleProducEvent extends HotProductEvent {
  const LoadSaleProducEvent();

  @override
  List<Object?> get props => [];
}
