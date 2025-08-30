import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';
import '../theme/app_theme.dart';
import 'plans_screen.dart';
import 'partners_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tabIndex = 0;
  final tabs = <Widget>[
    const _OverviewTab(),
    const PartnersScreen(), // agora abre a tela de gestão de parceiros
    const PlansScreen(),
    Center(child: Text('Notificações')), // placeholder para notificações (pode abrir modal)
  ];

  void _onBottomTap(int idx) {
    setState(() => tabIndex = idx);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentIndex: tabIndex,
      onTab: _onBottomTap,
      child: tabs[tabIndex],
    );
  }
}

//---------------------------------------------------------

class _OverviewTab extends StatelessWidget {
  const _OverviewTab({Key? key}) : super(key: key);

  Widget _statBox(BuildContext context, {required String title, required String value, required String diff, IconData? trailing}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: TextStyle(color: Colors.grey[700], fontSize: 12)),
              SizedBox(height: 6),
              Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(diff, style: TextStyle(color: Colors.green, fontSize: 12)),
            ]),
          ),
          if (trailing != null)
            Icon(trailing, color: Colors.grey[600]),
        ],
      ),
    );
  }

  Widget _partnerTile(String name, String price, String meta) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
        color: Colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 20, backgroundColor: Colors.grey.shade100, child: Icon(Icons.store, color: AppTheme.primaryStart)),
          SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(meta, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            ]),
          ),
          SizedBox(width: 8),
          Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // small page title (top left, gray)
          Text('Visão Geral', style: TextStyle(color: Colors.grey[600], fontSize: 14)),

          SizedBox(height: 12),

          // Blue header card with app name (matches imagem)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [AppTheme.primaryStart, AppTheme.primaryEnd]),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                CircleAvatar(radius: 22, backgroundColor: Colors.white, child: Icon(Icons.local_gas_station, color: AppTheme.primaryStart)),
                SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Box Leste', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Administrativo', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ]),
                ),
                Icon(Icons.info_outline, color: Colors.white70),
              ],
            ),
          ),

          SizedBox(height: 12),

          // White card containing the overview stats and top parceiros
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Visão Geral', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 12),

                // stats - vertically stacked small boxes
                Column(
                  children: [
                    _statBox(context, title: 'Assinantes Ativos', value: '1.247', diff: '+12%', trailing: Icons.people),
                    SizedBox(height: 10),
                    _statBox(context, title: 'Receita Mensal Atual', value: 'R\$18.750,00', diff: '+8,2%', trailing: Icons.attach_money),
                    SizedBox(height: 10),
                    _statBox(context, title: 'Parceiros Ativos', value: '12', diff: '+2 novos parceiros', trailing: Icons.local_mall),
                  ],
                ),

                SizedBox(height: 12),

                Text('Top Parceiros', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),

                // list of top partners
                Column(
                  children: [
                    _partnerTile('Posto Box Leste', 'R\$2.340,50', '89 usos este mês'),
                    SizedBox(height: 8),
                    _partnerTile('Loja de Conveniência', 'R\$1.560,30', '67 usos este mês'),
                    SizedBox(height: 8),
                    _partnerTile('Posto Box Leste', 'R\$2.340,50', '89 usos este mês'),
                    SizedBox(height: 8),
                    _partnerTile('Loja de Conveniência', 'R\$1.560,30', '67 usos este mês'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // botões de planos/parceiros removidos conforme solicitado
          SizedBox(height: 8),
        ],
      ),
    );
  }
}