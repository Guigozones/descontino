import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.mainGradient),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  CircleAvatar(radius: 36, backgroundColor: Colors.white, child: Icon(Icons.local_gas_station, size: 36, color: AppTheme.primaryStart)),
                  SizedBox(height: 12),
                  Text('Box Leste', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.95), borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        Text('Acesse sua conta', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 12),
                        TextField(decoration: InputDecoration(hintText: 'seu@email.com')),
                        SizedBox(height: 8),
                        TextField(obscureText: true,decoration: InputDecoration(hintText: 'senha')),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryStart,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                            child: Text('Entrar'),
                          ),
                        ),
                        TextButton(onPressed: () => Navigator.pushNamed(context, '/recover'), child: Text('Esqueceu a senha?')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Não tem conta?'),
                            TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: Text('Cadastrar'))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
