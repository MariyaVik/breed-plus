import 'package:breed_plus/common/navigation/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _usernameError;
  String? _passwordError;

  Future<void> _login(BuildContext context) async {
    setState(() {
      _usernameError = null;
      _passwordError = null;
    });
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 700));
      context.goNamed(RouteName.home);
      // final username = _usernameController.text;
      // final password = _passwordController.text;
      // context.read<AuthCubit>().login(username, password);
    }
  }

  String? nameValidator(String? value) {
    if (_usernameError != null) return _usernameError;
    if (value == null || value.isEmpty) return 'Обязательное поле';
    return null;
  }

  String? passwordValidator(String? value) {
    if (_passwordError != null) return _passwordError;
    if (value == null || value.isEmpty) return 'Обязательное поле';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, designSize: const Size(375, 812));
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              Text(
                'Text about application',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold, height: 1.2),
              ),
              SizedBox(height: 48),
              // BlocConsumer<AuthCubit, AuthState>(
              //   listener: (context, state) {
              //     if (state is AuthAuthenticated) {
              //       context.goNamed(RouteName.base);
              //     } else if (state is AuthError) {
              //       if (state.error.toLowerCase().contains('пользователя')) {
              //         _usernameError = state.error;
              //       } else if (state.error.toLowerCase().contains('пароль')) {
              //         _passwordError = state.error;
              //       }
              //       _formKey.currentState!.validate();
              //     }
              //   },
              // builder: (context, state) {
              //   return
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      cursorColor: Theme.of(context).primaryColor,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(hintText: 'Логин'),
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      validator: nameValidator,
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _passwordController,
                      cursorColor: Theme.of(context).primaryColor,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(hintText: 'Пароль'),
                      obscureText: true,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      onFieldSubmitted: (value) => _login(context),
                      validator: passwordValidator,
                    ),
                    SizedBox(height: 36),
                    isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () => _login(context),
                            child: const Text('Войти'),
                          ),
                  ],
                ),
              ),
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
