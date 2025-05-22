
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/address/create/bloc/ClientAddressCreateState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientAddressCreateBloc extends Bloc<ClientAddressCreateEvent, ClientAddressCreateState> {

  ClientAddressCreateBloc (): super(ClientAddressCreateState()) {
    on<ClientAddressCreateInitEvent>(_onClientAddressCreateInitEvent);
    on<AddressChanged>(_onAddressChanged);
    on<NeighborhoodChanged>(_onNeighborhoodChanged);
    on<FormSubmit>(_onFormSubmit);
  }

  final formkey = GlobalKey<FormState>();

  Future<void> _onClientAddressCreateInitEvent(ClientAddressCreateInitEvent event, Emitter<ClientAddressCreateState> emit) async {
    emit(
      state.copyWith(
        formKey: formkey
      )
    );
  }

  Future<void> _onAddressChanged(AddressChanged event, Emitter<ClientAddressCreateState> emit) async {
    emit(
      state.copyWith(
        address: BlocFormItem(
          value: event.address.value,
          error: event.address.value.isNotEmpty ? null : 'Ingresa la direccion'
        ),
        formKey: formkey
      )
    );
  }

  Future<void> _onNeighborhoodChanged(NeighborhoodChanged event, Emitter<ClientAddressCreateState> emit) async {
    emit(
      state.copyWith(
        neighborhood: BlocFormItem(
          value: event.neighborhood.value,
          error: event.neighborhood.value.isNotEmpty ? null : 'Ingresa el barrio'
        ),
        formKey: formkey
      )
    );
  }

   Future<void> _onFormSubmit(FormSubmit event, Emitter<ClientAddressCreateState> emit) async {}
}