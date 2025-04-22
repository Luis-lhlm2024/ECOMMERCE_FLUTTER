import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/ShoppingBag/ClientShoppingBagItem.dart';
import 'package:flutter/material.dart';

class ClientShoppingBagPage extends StatefulWidget {
  const ClientShoppingBagPage({super.key});

  @override
  State<ClientShoppingBagPage> createState() => _ClientShoppingBagPageState();
}

class _ClientShoppingBagPageState extends State<ClientShoppingBagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi orden'),
      ),
      body: ClientShoppingBagItem(null),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.grey[300],
        child: Column(
          children: [
            Divider(color: Colors.grey[400], height: 0,),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'TOTAL: \$0',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
              ),
              Container(
                width: 230,
                child: DefaultButton(
                  text: 'CONFIRMAR ORDEN',
                  onPressed: () {}
                ),
              )
              ],
            )
          ],
        ),
      ),
    );
  }
}