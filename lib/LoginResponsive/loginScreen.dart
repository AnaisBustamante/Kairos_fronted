import 'package:flutter/material.dart';
import 'package:kairos_fronted/LoginResponsive/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Center(
            child: SingleChildScrollView(
              child: const LoginCard(),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  bool _obscurePassword = true;
  final _aliasController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: screenWidth > 600 ? 400 : screenWidth * 0.9,
      ),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: MyAppColor.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Logo(),
                const TitleWithUnderline(),
                const SizedBox(height: 20),
                AliasField(controller: _aliasController),
                const SizedBox(height: 10),
                PasswordField(
                  controller: _passwordController,
                  obscurePassword: _obscurePassword,
                  toggleVisibility: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                const SizedBox(height: 30),
                SubmitButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Lógica de inicio de sesión
                  }
                }),
                const SizedBox(height: 50),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Image.asset(
        'assets/images/logo.png',
        height: 130,
      ),
    );
  }
}

class TitleWithUnderline extends StatelessWidget {
  const TitleWithUnderline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Inicia Sesión',
          style: TextStyle(
            fontFamily: 'MohrRoundedAlt',
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: MyAppColor.blackColor,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 1,
          decoration: BoxDecoration(
            color: MyAppColor.pink80Color,
            border: Border.all(
              color: MyAppColor.pink80Color,
              width: 1,
            ),
          ),
        ),
      ],
    );
  }
}

class AliasField extends StatelessWidget {
  final TextEditingController controller;

  const AliasField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: 10,
      decoration: const InputDecoration(
        labelText: 'Alias',
        hintText: 'Ingresa tu alias',
      ),
      style: const TextStyle(
        fontFamily: 'MohrRoundedAlt',
        fontWeight: FontWeight.normal
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El alias es obligatorio';
        } else if (!RegExp(r'^[a-zA-Z]+\$').hasMatch(value)) {
          return 'El alias debe contener solo letras (máximo 10)';
        }
        return null;
      },
    );
  }
}

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscurePassword;
  final VoidCallback toggleVisibility;

  const PasswordField({
    required this.controller,
    required this.obscurePassword,
    required this.toggleVisibility,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscurePassword,
      maxLength: 15,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        hintText: 'Ingresa tu contraseña',
        suffixIcon: IconButton(
          icon: Icon(
            obscurePassword ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: toggleVisibility,
        ),
      ),
      style: const TextStyle(
        fontFamily: 'MohrRoundedAlt',
        fontWeight: FontWeight.normal
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'La contraseña es obligatoria';
        } else if (!RegExp(r'^[a-zA-Z0-9]+\$').hasMatch(value)) {
          return 'La contraseña debe ser alfanumérica (máximo 15)';
        }
        return null;
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SubmitButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyAppColor.pink80Color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: const Text(
          'Ingresar',
          style: TextStyle(
            fontFamily: 'MohrRoundedAlt',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: MyAppColor.backgroundColor,
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '@Kairos 2024',
      style: TextStyle(
        fontFamily: 'MohrRoundedAlt',
        fontWeight: FontWeight.w600,
        color: MyAppColor.blackColor,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
