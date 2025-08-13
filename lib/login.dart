import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mshtsht/auth/auth_bloc.dart';
// import 'package:mshtsht/auth/auth_event.dart' as auth_event;
import 'package:mshtsht/components/customtextfield.dart';
import 'package:mshtsht/components/my_button.dart';
import 'package:mshtsht/components/mysquare.dart';

import 'auth/auth_event.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // Future<void> signuserin() async {
  //   try {
  //     // Call repository through bloc
  //     context.read<AuthBloc>().add(
  //       LoginRequested(
  //         email: emailController.text.trim(),
  //         password: passwordController.text.trim(),
  //       ),
  //     );
  //   } catch (e) {
  //     showError('Something went wrong: $e');
  //   }
  // }

  // void wrongEmailmessage() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Error'),
  //         content: Text('No user found for that email.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void wrongPasswordmessage() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Error'),
  //         content: Text('Wrong password provided for that user.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void showError(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Error'),
  //         content: Text(message),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Icon(Icons.person_4_sharp, size: 100),
              const SizedBox(height: 50),
              const Text(
                'Welcome back you have been missed',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              CustomTextField(
                labelText: 'Email',
                controller: emailController,
                obscureText: false,
              ),
              const SizedBox(height: 25),
              CustomTextField(
                labelText: 'Password',
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              MyButton(
                onTap: () {
                  context.read<AuthBloc>().add(
                    AuthLoginRequested(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.grey[400], thickness: 0.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700], fontSize: 16),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.grey[400], thickness: 0.5),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const MySquare(imagePath: 'lib/images/google.png'),
                    const SizedBox(width: 30),
                    const MySquare(imagePath: 'lib/images/apple.png'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
