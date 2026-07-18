import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../widgets/buttons/custom_button.dart';
import '../../../widgets/inputs/custom_text_field.dart';
import '../../../providers/auth_provider.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

 Future<void> login() async {
  if (emailController.text.trim().isEmpty ||
      passwordController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please enter email and password"),
      ),
    );
    return;
  }

  try {
    await context.read<AuthProvider>().login(
          email: emailController.text.trim(),
          password: passwordController.text,
        );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Login Successful"),
      ),
    );

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.dashboard,
    );
  } catch (e) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(e.toString()),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomTextField(
          controller: emailController,
          label: "Email",
          hintText: "Enter your email",
          prefixIcon: Icons.email_rounded,
          keyboardType: TextInputType.emailAddress,
        ),

        const SizedBox(height: AppSpacing.lg),

        CustomTextField(
          controller: passwordController,
          label: "Password",
          hintText: "Enter your password",
          prefixIcon: Icons.lock_rounded,
          isPassword: true,
        ),

        const SizedBox(height: AppSpacing.sm),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text("Forgot Password?"),
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        CustomButton(
          text: "Login",
          icon: Icons.login_rounded,
          isLoading: isLoading,
          onPressed: login,
        ),

        const SizedBox(height: AppSpacing.lg),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
              style: TextStyle(color: Colors.white70),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.register,
                );
              },
              child: const Text("Create Account"),
            ),
          ],
        ),
      ],
    );
  }
}