import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mshtsht/auth/auth_bloc.dart';
import 'package:mshtsht/auth/auth_repository.dart';
import 'package:mshtsht/home_page.dart';
import 'package:mshtsht/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final SharedPreferences prefs;
  late final AuthBloc authBloc;
  late final AuthRepository authRepository;

  @override
  void initState() {
    super.initState();
    initMethod();
  }

  initMethod() async {
    prefs = await SharedPreferences.getInstance();
    authRepository = AuthRepository(prefs: prefs);
    authBloc = AuthBloc(authRepository: authRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AuthBloc(authRepository: authRepository)..add(AppStarted()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(backgroundColor: Colors.blue),
              );
            } else if (state is AuthAuthenticated) {
              return HomePage();
            } else if (state is AuthUnauthenticated) {
              return LoginPage();
            }
            // Default fallback widget
            return const Placeholder();
          },
        ),
      ),
    );
  }
}
