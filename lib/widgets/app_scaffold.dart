import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final ValueChanged<int>? onTab;
  AppScaffold({required this.child, this.currentIndex = 0, this.onTab});

  void _showNotifications(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (ctx) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            Widget notifCard({
              required Color bg,
              required IconData icon,
              required String title,
              required String subtitle,
              required String time,
              bool faded = false,
            }) {
              return Container(
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent.withOpacity(0.6)),
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.6),
                      child: Icon(icon, color: faded ? Colors.white30 : Colors.black87),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: faded ? Colors.white54 : Colors.black87)),
                          SizedBox(height: 4),
                          Text(subtitle, style: TextStyle(color: faded ? Colors.white54 : Colors.black54, fontSize: 12)),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(time, style: TextStyle(color: faded ? Colors.white38 : Colors.black45, fontSize: 12)),
                  ],
                ),
              );
            }

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Notificações', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Spacer(),
                      TextButton(onPressed: () { /* marcar todas como lidas - implementar */ }, child: Text('Marcar todas como lidas')),
                    ],
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      itemCount: 4,
                      separatorBuilder: (_, __) => SizedBox(height: 12),
                      itemBuilder: (_, idx) {
                        if (idx == 0) {
                          return notifCard(
                            bg: Color(0xFFD9F8F3),
                            icon: Icons.card_giftcard,
                            title: 'Novo Cupom Disponível',
                            subtitle: '15% OFF em combustível no Posto Box Leste',
                            time: '2 min atrás',
                          );
                        } else if (idx == 1) {
                          return Container(
                            decoration: BoxDecoration(color: Color(0xFFFAF3C9), borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                CircleAvatar(child: Icon(Icons.schedule)),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Cupom Expirado', style: TextStyle(fontWeight: FontWeight.bold)),
                                      SizedBox(height: 4),
                                      Text('15% OFF em combustível no Posto Box Leste', style: TextStyle(color: Colors.black54, fontSize: 12)),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text('1h atrás', style: TextStyle(color: Colors.black45, fontSize: 12)),
                              ],
                            ),
                          );
                        } else {
                          return notifCard(
                            bg: Color(0xFFE9F8F5),
                            icon: Icons.card_giftcard,
                            title: 'Novo Cupom Disponível',
                            subtitle: '15% OFF em combustível no Posto Box Leste',
                            time: '2 min atrás',
                            faded: true,
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () { Navigator.pop(ctx); /* navegar para lista completa se quiser */ },
                      child: Text('Ver todas as notificações'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
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
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: Icon(Icons.local_gas_station, color: Colors.white),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Box Leste', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('Benefícios Exclusivos', style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Visão Geral'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Parceiros'),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Planos'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notificações'),
        ],
      ),
    );
  }
}