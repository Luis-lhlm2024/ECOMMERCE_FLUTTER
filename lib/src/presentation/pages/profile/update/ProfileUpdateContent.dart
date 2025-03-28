import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultIconBack.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultTextField.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:flutter/material.dart';

class ProfileUpdateContent extends StatelessWidget {

ProfileUpdateBloc? bloc;
ProfileUpdateState? state;
User? user;
  
  ProfileUpdateContent (this.bloc, this.state, this.user);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state?.formKey,
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
                  _imageProfile(context),
                  // Spacer(),
                  _cardProfileInfo(context)
                ],
              ),
            ),
          ),
          //efaultIconBack(left: 15, top: 50),
          Positioned(
              left: -33,
              top: -70,
              child: DefaultIconBack(
                left: 0,top: 0
              ),
            ),
        ],
      ),
    );
  }

  Widget _cardProfileInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        )
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            _textUpdateInfo(),
            _textFieldName(),
            _textFieldLastname(),
            _textFieldPhone(),
            _fabSubmit()           
          ],
        ),
      ),
    );
  }

  Widget _fabSubmit() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: 10, top: 20),
      child: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          bloc?.add(ProfileUpdateFormSubmit());
        },
        child: Icon(
          Icons.check,
          color: Colors.white,
          ),
        ),
    );
  }

  Widget _textUpdateInfo() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 17, left: 35, bottom: 10),
      child: Text('ACTUALIZAR INFORMACION',
      style: TextStyle(
        fontSize: 19
      ),
    ),
  );
}

   Widget _textFieldName() {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextField(
            label: 'Nombre',
            icon: Icons.person_4,
            color: Colors.black,
            initialValue: user?.name ?? '',
            onChange: (text) {
               bloc?.add(ProfileUpdateNameChanged(name: BlocFormItem(value: text)));
            },
             validator: (value) {
              return bloc?.state.name.error;
             },
          )
    );
  }

     Widget _textFieldLastname() {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextField(
            label: 'Apellido',
            icon: Icons.person_outline,
            color: Colors.black,
            initialValue: user?.lastname ?? '',
            onChange: (text) {
             bloc?.add(ProfileUpdateLastnameChanged(lastname: BlocFormItem(value: text)));
            },
             validator: (value) {
               return bloc?.state.lastname.error;
             }
          )
    );
  }

     Widget _textFieldPhone() {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: DefaultTextField(
            label: 'Telefono',
            icon: Icons.phone,
            color: Colors.black,
            initialValue: user?.phone ?? '',
            onChange: (text) {
               bloc?.add(ProfileUpdatePhoneChanged(phone: BlocFormItem(value: text)));
            },
             validator: (value) {
               return bloc?.state.phone.error;
             }
          )
    );
  }

  Widget _imageProfile(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectOptionImageDialog(
          context, 
          () { bloc?.add(ProfileUpdatePickImage()); },
          () { bloc?.add(ProfileUpdateTakePhoto()); },
          );
      },
      child: Container(
        margin: EdgeInsets.only(top: 100),
        width: 150,
        child: AspectRatio(
          aspectRatio: 1/1,
          child: ClipOval(
            child: state!.image != null 
            ? Image.file(
              state!.image!,
              fit: BoxFit.cover,
              ) 
            : FadeInImage.assetNetwork(
              placeholder: 'assets/img/user_image.png', 
              image: user!.image!,
              fit: BoxFit.cover,
              fadeInDuration:  Duration(seconds: 1),
              ),
          ),
        ),
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Image.asset('assets/img/background3.jpg',
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
    color: Color.fromRGBO(0, 0, 0, 0.7),
    colorBlendMode: BlendMode.darken,
    );
  }
}