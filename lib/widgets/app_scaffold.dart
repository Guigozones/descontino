import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../screens/notificacoes_screen.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final ValueChanged<int>? onTab;
  AppScaffold({required this.child, this.currentIndex = 0, this.onTab});

  void _showNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotificacoesScreen(),
      ),
    );
  }

  String _getTitleByIndex(int index) {
    switch (index) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Veículos';
      case 2:
        return 'Rotas';
      case 3:
        return 'Conversas';
      case 4:
        return 'Perfil';
      default:
        return 'Dashboard';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.mainGradient),
        child: SafeArea(
          child: Column(
            children: [
              // header
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/logorotas.jpg',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      _getTitleByIndex(currentIndex),
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.notifications_none, color: Colors.white),
                      onPressed: () => _showNotifications(context),
                    ),
                  ],
                ),
              ),
              // content
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppTheme.primaryStart,
        unselectedItemColor: Colors.grey,
        onTap: onTab,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Veículos'),
          BottomNavigationBarItem(icon: Icon(Icons.route), label: 'Rotas'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Conversas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}