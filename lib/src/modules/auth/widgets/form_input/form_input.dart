import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/constants/properties.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:s_fashion/src/modules/auth/logic/auth_bloc.dart';
import 'package:s_fashion/src/modules/auth/logic/auth_event.dart';
import 'package:s_fashion/src/modules/auth/logic/auth_state.dart';
import 'package:s_fashion/src/modules/auth/widgets/dropdown_button/dropdown_language.dart';
import 'package:s_fashion/src/modules/auth/widgets/form_input/input_field.dart';
import 'package:s_fashion/src/widgets/submit_button.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> with TickerProviderStateMixin {
  bool _isModeLogin = true;

  final FocusNode _userNameNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _passwordController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  Map<String, String?> auth = {
    'username': '',
    'email': '',
    'password': '',
  };

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _passwordController.dispose();
    _userNameNode.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    _confirmPasswordNode.dispose();
    super.dispose();
  }

  /// Change [_isModeLogin] between Login(true) and Register(false)
  void onChangeMode() {
    if (_isModeLogin) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    setState(() {
      unfocusAll();
      _passwordController.clear();
      _isModeLogin = !_isModeLogin;
    });
  }

  /// Validator username
  String? validatorUsername(String? value) {
    if (value == null ||
        value.trim().isEmpty ||
        value.trim().length > 20 ||
        value.trim().length < 3) {
      return AppLocalizations.of(context)!.invalid_username;
    }
    return null;
  }

  /// Validator email
  String? validatorEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.invalid_gmail;
    }

    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) return AppLocalizations.of(context)!.invalid_gmail;

    return null;
  }

  /// Validator password
  String? validatorPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.invalid_password;
    }
    return null;
  }

  /// Validator confirm password
  String? validatorConfirmPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.invalid_confirm_password;
    }

    if (value != _passwordController.text) {
      return AppLocalizations.of(context)!.invalid_confirm_password;
    }

    return null;
  }

  /// Check all valid and save to [auth] to on login or resgister
  /// If mode is Login to add [LoginEvent]
  /// Elde mode is Register to add [RegisterEvent]
  void onSubmit() {
    unfocusAll();
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    if (_isModeLogin) {
      BlocProvider.of<AuthBloc>(context).add(LoginEvent(auth: auth));
    } else {
      BlocProvider.of<AuthBloc>(context).add(RegisterEvent(auth: auth));
    }
  }

  /// Unfocus all focus nodes
  void unfocusAll() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 330,
      padding: const EdgeInsets.all(Properties.kPaddingMedium),
      decoration: BoxDecoration(
        color: MyColors.colorWhile.withOpacity(0.9),
        borderRadius: BorderRadius.circular(
          Properties.kPaddingLarge,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _isModeLogin
                    ? AppLocalizations.of(context)!.login.toUpperCase()
                    : AppLocalizations.of(context)!.register.toUpperCase(),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              const DropdownLanguage(),
            ],
          ),
          const SizedBox(height: Properties.kPaddingMedium),
          Form(
            key: _formKey,
            child: Column(
              children: [
                FadeTransition(
                  opacity: _opacityAnimation,
                  child: InputField(
                    focusNode: _userNameNode,
                    labelText: AppLocalizations.of(context)!.name,
                    hintText: AppLocalizations.of(context)!.hint_name,
                    isShow: !_isModeLogin,
                    validator: _isModeLogin ? null : validatorUsername,
                    onFieldSubmit: (_) =>
                        FocusScope.of(context).requestFocus(_emailNode),
                    onSaved: _isModeLogin
                        ? null
                        : (userName) => auth['username'] = userName!,
                  ),
                ),
                if (!_isModeLogin)
                  const SizedBox(height: Properties.kPaddingSmall),
                InputField(
                  focusNode: _emailNode,
                  labelText: AppLocalizations.of(context)!.email,
                  hintText: AppLocalizations.of(context)!.hint_email,
                  validator: validatorEmail,
                  onFieldSubmit: (_) =>
                      FocusScope.of(context).requestFocus(_passwordNode),
                  onSaved: (email) => auth['email'] = email!,
                ),
                const SizedBox(height: Properties.kPaddingSmall),
                InputField(
                  focusNode: _passwordNode,
                  labelText: AppLocalizations.of(context)!.password,
                  hintText: AppLocalizations.of(context)!.hint_password,
                  obscureText: true,
                  validator: validatorPassword,
                  controller: _passwordController,
                  onFieldSubmit: _isModeLogin
                      ? null
                      : (_) => FocusScope.of(context)
                          .requestFocus(_confirmPasswordNode),
                  onSaved: (password) => auth['password'] = password!,
                ),
                if (!_isModeLogin)
                  const SizedBox(height: Properties.kPaddingSmall),
                FadeTransition(
                  opacity: _opacityAnimation,
                  child: InputField(
                    focusNode: _confirmPasswordNode,
                    labelText: AppLocalizations.of(context)!.confirm_password,
                    hintText:
                        AppLocalizations.of(context)!.hint_confirm_password,
                    obscureText: true,
                    isShow: !_isModeLogin,
                    validator: _isModeLogin ? null : validatorConfirmPassword,
                  ),
                ),
                const SizedBox(height: Properties.kPaddingLarge),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const CircularProgressIndicator();
                    }

                    return SubmitButton(
                      width: 300,
                      title: _isModeLogin
                          ? AppLocalizations.of(context)!.login.toUpperCase()
                          : AppLocalizations.of(context)!
                              .register
                              .toUpperCase(),
                      elevation: 0,
                      onClick: onSubmit,
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: Properties.kPaddingLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isModeLogin
                    ? AppLocalizations.of(context)!.not_have_an_account
                    : AppLocalizations.of(context)!.have_an_account,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              const SizedBox(width: Properties.kPaddingSmall),
              TextButton(
                onPressed: onChangeMode,
                child: Text(
                  _isModeLogin
                      ? AppLocalizations.of(context)!.register
                      : AppLocalizations.of(context)!.login,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
