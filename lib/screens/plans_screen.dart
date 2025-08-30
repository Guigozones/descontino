import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Escolha seu plano', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            _PlanCard(title: 'Básico', price: 'R\$10,99/mês', bullets: ['10% em combustível', '5% na loja']),
            SizedBox(height: 12),
            _PlanCard(title: 'Família', price: 'R\$34,99/mês', bullets: ['Até 4 usuários', '10% em combustível']),
          ],
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final String title, price;
  final List<String> bullets;
  _PlanCard({required this.title, required this.price, required this.bullets});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Colors.grey.shade200)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 6),
          Text(price, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          ...bullets.map((b) => Row(children: [Icon(Icons.check, size: 16, color: Colors.green), SizedBox(width: 6), Text(b)])).toList(),
          SizedBox(height: 12),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: Text('Escolher Plano')))
        ]),
      ),
    );
  }
}
