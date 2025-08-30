import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RecoverScreen extends StatelessWidget {
  const RecoverScreen({Key? key}) : super(key: key);

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
                  Text('Recuperar Senha', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.95), borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        TextField(decoration: InputDecoration(hintText: 'seu@email.com')),
                        SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryStart,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text('Enviar e-mail de recuperação'),
                          ),
                        ),
                        TextButton(onPressed: () => Navigator.pop(context), child: Text('Voltar'))
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
