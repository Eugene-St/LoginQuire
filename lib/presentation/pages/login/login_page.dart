import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:quireloginform/injectable/injectable.dart';
import 'package:quireloginform/presentation/pages/login/bloc/auth_state.dart';
import 'package:quireloginform/presentation/pages/login/bloc/login_bloc.dart';
import 'package:quireloginform/presentation/pages/login/bloc/login_event.dart';
import 'package:quireloginform/presentation/pages/login/bloc/login_state.dart';
import 'package:quireloginform/presentation/pages/login/widgets/need_help.dart';
import 'package:quireloginform/core/utils/snack_bar/snack_bar.dart';
import 'widgets/signup_custom_textfield.dart';
import 'widgets/login_button.dart';
import 'widgets/forgot_password.dart';
import 'widgets/privacy_policy.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double elementWidth = isTablet ? screenWidth / 2 : double.infinity;
    final double imageWidth = isTablet ? screenWidth / 2 - 100 : screenWidth - 100;

    return BlocProvider<LoginBloc>(
      create: (_) => getIt<LoginBloc>(),
      child: Scaffold(
        body: BlocConsumer<LoginBloc, BaseState>(
          listener: _authStateListener,
          builder: (context, state) => _buildAuthForm(
            context,
            state,
            elementWidth,
            imageWidth,
            isTablet,
          )
        ),
      ),
    );
  }

  void _authStateListener(BuildContext context, BaseState state) {
    if (state is LoginSuccess) {
      context.showSnackBar('Login Success');
    } else if (state is LoginFailure) {
      context.showSnackBar(state.error);
    }
  }

  Widget _buildAuthForm(
    BuildContext context, 
    BaseState state,
    double elementWidth,
    double imageWidth,
    bool isTablet) {
    final isError = state is LoginFailure;
    return Stack(
          children: [
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? 64.0 : 21.0,
                    vertical: isTablet ? 32.0 : 21.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: imageWidth,
                        child: Image.asset(
                          'assets/login-logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 56.0),
                      SizedBox(
                        width: elementWidth,
                        child: SignupCustomTextField(
                      controller: emailController,
                      hintText: "Email",
                      isError: isError,
                    ),
                      ),
                      const SizedBox(height: 8.0),
                      SizedBox(
                        width: elementWidth,
                        child: SignupCustomTextField(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true,
                      isError: isError,
                    ),
                      ),
                      const SizedBox(height: 32.0),
                      SizedBox(
                        height: 50,
                        width: elementWidth,
                        child: LoginButton(
                          onPressed: () => _submitLogin(context),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: elementWidth,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            NeedHelp(),
                            ForgotPassword(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 60.0,
              left: 0,
              right: 0,
              child: Center(
                child: PrivacyPolicy(),
              ),
            ),
            if (state is LoadingState)
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
          ],
        );
  }

  void _submitLogin(BuildContext context) async {
    BlocProvider.of<LoginBloc>(context).add(
      OnLoginEvent(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }
}