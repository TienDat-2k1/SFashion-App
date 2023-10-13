import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/modules/detail/logic/images_section/index_image_state.dart';

class IndexImageCubit extends Cubit<IndexImageState> {
  IndexImageCubit() : super(const IndexImageState(index: 0));

  void setNewIndexImage(int index) => emit(IndexImageState(index: index));
}
