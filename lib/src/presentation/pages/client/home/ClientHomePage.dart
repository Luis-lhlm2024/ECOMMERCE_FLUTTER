import 'package:ecommerce_flutter/main.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/home/bloc/ClientHomeState.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/RolesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State <ClientHomePage> createState() =>  ClientHomePageState();
}

class  ClientHomePageState extends State <ClientHomePage> {

  ClientHomeBloc? _bloc;

  List<Widget> pageList = <Widget> [
    RolesPage()
  ];   

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientHomeBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Menu')),
      drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black
                  ),
                  child: Text(
                  'Menu de cliente',
                  style: TextStyle(
                    color: Colors.white
                  ),
                  )
                ),
                ListTile(
                  title: Text('Roles'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    _bloc?.add(ChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Cerrar Sesión'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    _bloc?.add(Logout());
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder:  (context) => MyApp()),
                      (route) => false
                    );                    
                  },
                )
              ],
            ),
          );
        }
      ),
      body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return pageList[state.pageIndex];
        }
      )
    );
  }

}