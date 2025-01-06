import 'package:flutter/material.dart';
import 'package:kairos_fronted/LoginResponsive/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final _aliasController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con imagen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido principal
          LayoutBuilder(
            builder: (context, constraints) {
              // Obteniendo tamaño de la pantalla
              double screenWidth = MediaQuery.of(context).size.width;

              return Center(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
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
                              // Logo
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Image.asset(
                                  'assets/images/logo.png', // Cambia a la ruta correcta del logo
                                  height: 130,
                                ),
                              ),

                              // Texto de Iniciar Sesión
                              const Align(
                                alignment: Alignment.centerLeft, // Alinea el texto a la izquierda
                                child: Text(
                                  'Inicia Sesión',
                                  textAlign: TextAlign.start, // Alineación de texto
                                  style: TextStyle(
                                    fontFamily: 'MohrRoundedAlt',
                                    fontWeight: FontWeight.w600, 
                                    fontSize: 20,
                                    color: MyAppColor.blackColor,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Linea debajo del título 'Inicia sesión'
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.7,
                                height: 1,
                                decoration: BoxDecoration(
                                  color: MyAppColor.pink80Color,
                                  border: Border.all(
                                    color: MyAppColor.pink80Color,
                                    width: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Campo Alias
                              TextFormField(
                                controller: _aliasController,
                                maxLength: 10,
                                decoration: const InputDecoration(
                                  labelText: 'Alias',
                                  labelStyle: TextStyle(
                                    fontFamily: 'MohrRoundedAlt',
                                    color: MyAppColor.blackColor,
                                    fontSize: 16,
                                  ),
                                  hintText: 'Ingresa tu alias',
                                  hintStyle: TextStyle(
                                    fontFamily: 'MohrRoundedAlt',
                                    color: MyAppColor.blackColor,
                                    fontSize: 16,
                                  ),
                                  //counterText: '',
                                ),
                                style: const TextStyle(
                                  fontFamily: 'MohrRoundedAlt',
                                  color: MyAppColor.blackColor,
                                  fontSize: 16,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'El alias es obligatorio';
                                  } else if (!RegExp(r'^[a-zA-Z]+\$').hasMatch(value)) {
                                    return 'El alias debe contener solo letras (máximo 10)';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),

                              // Campo Contraseña
                              TextFormField(
                                controller: _passwordController,
                                obscureText: _obscurePassword,
                                maxLength: 15,
                                decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  labelStyle: const TextStyle(
                                    fontFamily: 'MohrRoundedAlt',
                                    color: MyAppColor.blackColor,
                                  ),
                                  hintText: 'Ingresa tu contraseña',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'MohrRoundedAlt',
                                    color: MyAppColor.blackColor,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                ),
                                style: const TextStyle(
                                  fontFamily: 'MohrRoundedAlt',
                                  color: MyAppColor.blackColor,
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'La contraseña es obligatoria';
                                  } else if (!RegExp(r'^[a-zA-Z0-9]+\$').hasMatch(value)) {
                                    return 'La contraseña debe ser alfanumérica (máximo 15)';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),

                              // Botón Ingresar
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Lógica de inicio de sesión
                                    }
                                  },
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
                                      fontWeight: FontWeight.w600, // MohrRoundedAlt-SemiBold
                                      fontSize: 18,
                                      color: MyAppColor.backgroundColor,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 50),
                              // Footer
                              const Text(
                                '@Kairos 2024',
                                style: TextStyle(
                                  fontFamily: 'MohrRounded',
                                  fontWeight: FontWeight.w600, // MohrRounded-SemiBoldIt
                                  color: MyAppColor.blackColor,
                                  fontStyle: FontStyle.italic, // Estilo itálico
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}