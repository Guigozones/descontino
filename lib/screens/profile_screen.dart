import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  Widget _sectionCard({required Widget child}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.zero,
      child: Padding(padding: EdgeInsets.all(12), child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Column(
        children: [
          // header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: AppTheme.mainGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                CircleAvatar(radius: 30, backgroundColor: Colors.white, child: Icon(Icons.person, size: 30, color: AppTheme.primaryStart)),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Constantino Neto', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('Minha Conta', style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.settings, color: Colors.white),
                  onPressed: () {
                    // abrir configurações
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 12),

          // Dados Pessoais
          _sectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [Icon(Icons.person), SizedBox(width: 8), Text('Dados Pessoais', style: TextStyle(fontWeight: FontWeight.bold))]),
                Divider(),
                SizedBox(height: 6),
                Text('Nome Completo', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 2),
                Text('Constantino Ferreira de Castro Neto'),
                SizedBox(height: 8),
                Text('CPF', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 2),
                Text('123.45.789-09'),
                SizedBox(height: 8),
                Text('Endereço', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 2),
                Text('Rua 01, 300 - Centro'),
              ],
            ),
          ),
          SizedBox(height: 12),

          // Contato
          _sectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [Icon(Icons.phone), SizedBox(width: 8), Text('Contato', style: TextStyle(fontWeight: FontWeight.bold))]),
                Divider(),
                SizedBox(height: 6),
                Text('Telefone', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 2),
                Text('(99) 99999-9999'),
                SizedBox(height: 8),
                Text('E-mail', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 2),
                Text('email@exemplo.com'),
              ],
            ),
          ),
          SizedBox(height: 12),

          // Logout
          _sectionCard(
            child: InkWell(
              onTap: () {
                // implementar logout
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 12),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Sair da conta', style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(height: 4), Text('Fazer logout do aplicativo', style: TextStyle(color: Colors.grey, fontSize: 12))])),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),

          SizedBox(height: 36), // espaçamento inferior para dar margem acima do bottom navigation
        ],
      ),
    );
  }
}
