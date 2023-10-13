import 'package:equatable/equatable.dart';

class IndexImageState extends Equatable {
  final int index;

  const IndexImageState({required this.index});

  @override
  List<Object?> get props => [index];
}
