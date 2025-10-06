// lib/views/login_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_app/components/button_component.dart';
import 'package:school_app/components/text_field_component.dart';
import 'package:school_app/resources/app_icons.dart';
import 'package:school_app/resources/app_spacing.dart';
import 'package:school_app/resources/app_strings.dart';
import 'package:school_app/resources/app_styles.dart';
import '../../providers/auth_provider.dart';
import '../home_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final parent_phone = phoneController.text.trim();
    final parent_password = passwordController.text.trim();

    if (parent_phone.isEmpty || parent_password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Phone and password are required')),
      );
      return;
    }

    setState(() => _loading = true);

    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await authProvider.login(parent_phone, parent_password);

      if (authProvider.isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  InputDecoration _inputDecoration({
    required String hint,
    Widget? prefix,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: prefix,
      suffixIcon: suffix,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 1.0, color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 1.5, color: Colors.blue),
      ),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Keep scaffold background transparent so gradient is the visible background
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Title & subtitle
              Column(
                children: [
                  Image.asset("assets/images/logo.png", height: 100),
                  Text(
                    AppStrings.loginScreenTitle,
                    style: AppStyles.title(size: 40.0),
                  ),
                  SizedBox(height: 6),
                  Text(
                    AppStrings.loginScreenDescription,
                    style: AppStyles.description(
                      color: Colors.white70,
                      size: 18,
                    ),
                  ),
                ],
              ),

              // AppSpacing.vertical(),

              // Login box
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: loginForm(), // login Form
              ),

              // AppSpacing.vertical(height: 40),

              // Footer (help / terms)
              footer(),
            ],
          ),
        ),
      ),
    );
  }

  // form and button
  loginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSpacing.vertical(height: 8),

        const Text(
          AppStrings.phoneNumber,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),

        AppSpacing.vertical(height: 8),

        TextFieldComponent(
          controller: phoneController,
          hint: "Enter your phone number",
          prefixIcon: Icons.phone,
          keyboardType: TextInputType.phone,
          label: "Phone",
          onChanged: (value) {
            //
          },
        ),

        AppSpacing.vertical(height: 8),

        const Text(
          AppStrings.password,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),

        AppSpacing.vertical(height: 8),

        TextField(
          controller: passwordController,
          obscureText: _obscurePassword,
          decoration: _inputDecoration(
            hint: "Enter your password",
            prefix: Icon(AppIcons.lock),
            suffix: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() => _obscurePassword = !_obscurePassword);
              },
            ),
          ),
        ),

        AppSpacing.vertical(height: 8),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ForgotPassword()),
              );
            },
            child: Text(AppStrings.forgotPassword),
          ),
        ),

        AppSpacing.vertical(height: 8),

        _loading
            ? const Center(child: CircularProgressIndicator())
            : ButtonComponent(
                onPressed: _login,
                label: AppStrings.signIn,
                // backgroundColor: AppColours.primaryColor1,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF2575FC), // Start color
                    Color(0xFF6A11CB), // End color
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
      ],
    );
  }

  // footer
  footer() {
    return Column(
      children: [
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppStrings.needHelp,
                style: TextStyle(color: Colors.white),
              ),

              TextSpan(
                text: AppStrings.contact,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),

        AppSpacing.vertical(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: const Text(
                AppStrings.terms,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            AppSpacing.horizontal(width: 8),

            GestureDetector(
              onTap: () {},
              child: const Text(
                AppStrings.privacyPolicy,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
