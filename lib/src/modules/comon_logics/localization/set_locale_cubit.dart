import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/localization/l10n.dart';
import 'package:s_fashion/src/modules/comon_logics/localization/set_locale_state.dart';

class SetLocaleCubit extends Cubit<SetLocaleState> {
  SetLocaleCubit() : super(SetLocaleState(locale: L10n.all.first));

  void onChangeLocal(Locale newLocale) => emit(
        SetLocaleState(locale: newLocale),
      );
}
