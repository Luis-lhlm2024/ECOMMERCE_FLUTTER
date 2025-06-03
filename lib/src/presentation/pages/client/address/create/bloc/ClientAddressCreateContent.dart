import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultIconBack.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultTextField.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateState.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateContent.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientAddressCreateContent extends StatelessWidget {
  
  // ClientAddressCreateBloc? bloc;
  // ClientAddressCreateState state;

  ClientAddressCreateContent({super.key});

  // ClientAddressCreateContent({ 
  //   super.key, 
  //   required this.bloc, 
  //   required this.state });

@override
Widget build(BuildContext context) {
  return BlocBuilder<ClientAddressCreateBloc, ClientAddressCreateState>(
    builder: (context, state) {
      final bloc = context.read<ClientAddressCreateBloc>();
      return Form(
        key: state.formKey,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _imageBackground(context),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _imageCategory(context),
                    _cardCategoryForm(context, state, bloc)
                  ],
                ),
              ),
            ),
            Positioned(
              left: -33,
              top: -70,
              child: DefaultIconBack(left: 0, top: 0),
            ),
          ],
        ),
      );
    },
  );
}

  // @override
  // Widget build(BuildContext context) {
  //   return Form(
  //       key: state.formKey,      
  //       child: Stack(
  //         alignment: Alignment.center,
  //         children: [
  //           _imageBackground(context),
  //           SingleChildScrollView(
  //             child: Container(
  //               height: MediaQuery.of(context).size.height,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   _imageCategory(context),
  //                   _cardCategoryForm(context)
  //                 ],
  //               ),
  //             ),
  //           ),
  //           //DefaultIconBack(left: 0, top: 0),
  //           Positioned(
  //             left: -33,
  //             top: -70,
  //             child: DefaultIconBack(
  //               left: 0,top: 0
  //             ),
  //           ),
  //         ],
  //       )
  //   );
  // }

  Widget _cardCategoryForm(BuildContext context, state, bloc){ 
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.44,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255,255,255,0.7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        )
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            _textNewAddress(),
            _textFieldAddress(state, bloc),
            _textFieldNeighborhood(state, bloc),
            _fabSubmit(state, bloc)
          ],
        ),
      ),
    );
  }
  
  Widget _fabSubmit(ClientAddressCreateState state, ClientAddressCreateBloc bloc){
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 30),
      child: FloatingActionButton(
        onPressed: (){
          if (state.formKey!.currentState!.validate()){
            bloc.add(FormSubmit());
          }
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _textNewAddress(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10, bottom: 10),
      child: Text(
        'NUEVA DIRECCION',
        style: TextStyle(
          fontSize: 17
        ),
      ),
    );
  }

  Widget _textFieldAddress(ClientAddressCreateState state, ClientAddressCreateBloc bloc){
    return DefaultTextField(
      label: 'Direccion', 
      icon: Icons.my_location, 
      onChange: (text){
        bloc?.add(AddressChanged(address:BlocFormItem(value: text)));
      },
      validator: (value){
        return state.address.error;
      },
      color: Colors.black,
    );
  }

  Widget _textFieldNeighborhood(ClientAddressCreateState state, ClientAddressCreateBloc bloc){
    return DefaultTextField(
      label: 'Barrio', 
      icon: Icons.list, 
      onChange: (text){
        bloc?.add(NeighborhoodChanged(neighborhood:BlocFormItem(value: text)));
      },
      validator: (value){
        return state.neighborhood.error;
      },
      color: Colors.black,
    );
  }

  Widget _imageCategory(BuildContext context){
    return Container(
      margin:  EdgeInsets.only(top: 70),
      child: Image.asset(
                'assets/img/location.png',
                fit: BoxFit.cover,
                width: 150,
                height: 150,
            ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset(
      'assets/img/address_background.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}