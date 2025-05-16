import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultIconBack.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultTextfield.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterContent extends StatelessWidget {
  
  final RegisterBloc? bloc;
  final RegisterState state;
  final GlobalKey<FormState> formKey;

  //RegisterContent(this.bloc, this.state);
  RegisterContent(this.bloc, this.state, this.formKey, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _imageBackgroundRegister(context),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _iconPersonRegister(),
                  _textFieldRegister(),
                  _textFieldNameRegister(),
                  _textFieldLastnameRegister(),
                  _textFieldEmailRegister(),
                  _textFieldPhoneRegister(),
                  _textFieldPasswordRegister(),
                  _textFieldConfirmPasswordRegister(),
                  _buttonRegister(),
                ],
              ),
            ),
          ),
          DefaultIconBack(
            left: 45,
            top: 15,
          ),
        ],
      ),
    );
  }

  Widget _iconPersonRegister() {
    return Icon(
      Icons.person,
      color: Colors.white,
      size: 100,
    );
  }

  Widget _textFieldRegister() {
    return Text(
      'REGISTRO',
      style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _textFieldNameRegister() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
          label: 'Nombre',
          icon: Icons.person,
          onChange: (text) {
            bloc?.add(RegisterNameChanged(name: BlocFormItem(value: text)));
          }),
    );
  }

  Widget _textFieldLastnameRegister() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
          label: 'Apellido',
          icon: Icons.person,
          onChange: (text) {
            bloc?.add(
                RegisterLastnameChanged(lastname: BlocFormItem(value: text)));
          }),
    );
  }

  Widget _textFieldEmailRegister() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
          label: 'Email',
          icon: Icons.email,
          onChange: (text) {
            bloc?.add(RegisterEmailChanged(email: BlocFormItem(value: text)));
          }),
    );
  }

  Widget _textFieldPhoneRegister() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
          label: 'Telefono',
          icon: Icons.phone,
          onChange: (text) {
            bloc?.add(RegisterPhoneChanged(phone: BlocFormItem(value: text)));
          }),
    );
  }

  Widget _textFieldPasswordRegister() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
          label: 'Contraseña',
          icon: Icons.lock,
          obscureText: true,
          onChange: (text) {
            bloc?.add(
                RegisterPasswordChanged(password: BlocFormItem(value: text)));
          }),
    );
  }

  Widget _textFieldConfirmPasswordRegister() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
          label: 'Confirma la Contraseña',
          icon: Icons.lock_outline,
          obscureText: true,
          onChange: (text) {
            bloc?.add(RegisterConfirmPasswordChanged(
                confirmpassword: BlocFormItem(value: text)));
          }),
    );
  }

  Widget _buttonRegister() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 65),
      child: DefaultButton(
          text: 'REGISTRARSE',
          color: Colors.green,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              bloc?.add(RegisterFormSubmit());
            } else {
              Fluttertoast.showToast(
                  msg: 'El formulario no es valido',
                  toastLength: Toast.LENGTH_LONG);
            }
          }),
    );
  }

  Widget _imageBackgroundRegister(BuildContext context) {
    return Image.asset(
      'assets/img/background3.jpg',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
