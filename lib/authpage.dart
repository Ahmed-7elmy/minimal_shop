import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mshtsht/auth/auth_bloc.dart';
import 'package:mshtsht/auth/auth_state.dart';
import 'package:mshtsht/login.dart';
import 'home_page.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (state is AuthAuthenticated) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
