import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/config/themes/styles.dart';
import 'package:s_fashion/src/constants/my_images.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:s_fashion/src/modules/auth/logic/auth_bloc.dart';
import 'package:s_fashion/src/modules/auth/logic/auth_state.dart';
import 'package:s_fashion/src/modules/auth/widgets/form_input/form_input.dart';
import 'package:s_fashion/src/modules/comon_logics/auth/auth_reponse_cubit.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showErrorSnackBar(String errorMes) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          errorMes,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        duration: const Duration(seconds: 1),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.colorTransparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ErrorState) {
            showErrorSnackBar(state.mesError);
          }
          if (state is LoadedState) {
            BlocProvider.of<AuthReponseCubit>(context)
                .setAuthReponse(state.response);
          }
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(MyImages.imgBgAuth),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'SFashion',
                    style: Style.styleLogo.copyWith(
                      fontSize: 32,
                      color: MyColors.colorWhile,
                    ),
                  ),
                  const SizedBox(height: Properties.kPaddingLarge),
                  const FormInput(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
