import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PartnersScreen extends StatefulWidget {
  const PartnersScreen({Key? key}) : super(key: key);

  @override
  _PartnersScreenState createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String query = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget partnerCard({
    required String name,
    required String subtitle,
    required String address,
    required String hours,
    required String discount,
    required int uses,
    required String revenue,
    String status = 'Ativo', // 'Pendente' ou 'Inativo'
    double rating = 4.8,
  }) {
    bool pending = status.toLowerCase() == 'pendente';
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(radius: 22, backgroundColor: Colors.grey.shade100, child: Icon(Icons.store, color: AppTheme.primaryStart)),
                SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(
                      children: [
                        Expanded(child: Text(name, style: TextStyle(fontWeight: FontWeight.bold))),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: pending ? Colors.orange.shade100 : Colors.green.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(pending ? 'Pendente' : '4.8★', style: TextStyle(fontSize: 12, color: pending ? Colors.orange.shade800 : Colors.green.shade800)),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                    SizedBox(height: 4),
                    Text(address, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                    SizedBox(height: 4),
                    Text('$hours • $discount', style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold)),
                  ]),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('$uses usos', style: TextStyle(color: Colors.grey[700])),
                Spacer(),
                Text(revenue, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.edit, size: 16),
                  label: Text('Editar'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade100, foregroundColor: Colors.black),
                ),
                SizedBox(width: 8),
                if (!pending)
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('Desativar'),
                  ),
                if (pending) ...[
                  Spacer(),
                  TextButton(onPressed: () {}, child: Text('Aprovar', style: TextStyle(color: Colors.green))),
                  SizedBox(width: 8),
                  TextButton(onPressed: () {}, child: Text('Rejeitar', style: TextStyle(color: Colors.red))),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildListForTab(int tabIndex) {
    // tabIndex: 0 -> Todos, 1 -> Ativos, 2 -> Inativos
    final items = <Widget>[
      partnerCard(
        name: 'Posto Box Leste',
        subtitle: 'Posto de Combustível',
        address: 'Av. Principal, 123 - Centro',
        hours: '06:00 - 22:00',
        discount: '15% OFF',
        uses: 89,
        revenue: 'R\$2.340,50',
        status: tabIndex == 2 ? 'Inativo' : 'Ativo',
      ),
      partnerCard(
        name: 'Loja de Conveniência',
        subtitle: 'Loja de Conveniência',
        address: 'Rua Secundária, 45',
        hours: '07:00 - 23:00',
        discount: '10% OFF',
        uses: 67,
        revenue: 'R\$1.560,30',
        status: tabIndex == 2 ? 'Inativo' : (tabIndex == 0 ? 'Pendente' : 'Ativo'),
      ),
    ];

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // header area inside page
        Container(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Row(
            children: [
              CircleAvatar(radius: 20, backgroundColor: Colors.white, child: Icon(Icons.store, color: AppTheme.primaryStart)),
              SizedBox(width: 12),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Box Leste', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Administrativo', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ]),
              Spacer(),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('+ Novo Parceiro'),
                style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryStart, foregroundColor: Colors.white),
              )
            ],
          ),
        ),

        // tabs
        TabBar(
          controller: _tabController,
          labelColor: AppTheme.primaryStart,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppTheme.primaryStart,
          tabs: [
            Tab(text: 'Todos (4)'),
            Tab(text: 'Ativos (3)'),
            Tab(text: 'Inativos (1)'),
          ],
        ),

        // search
        Padding(
          padding: EdgeInsets.all(12),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Buscar parceiros',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            ),
            onChanged: (v) => setState(() => query = v),
          ),
        ),

        // list
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: List.generate(3, (tabIdx) {
              final list = _buildListForTab(tabIdx);
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 16),
                  itemCount: list.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12),
                  itemBuilder: (_, idx) => list[idx],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
