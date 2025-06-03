import 'dart:convert';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/domain/models/Address.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class AddressService {

  Future<String> token;

  AddressService(this.token);

  Future<Resource<Address>> create(Address address) async{
    try { // http://172.27.44.141:3000/address
      print('Address: ${address.toJson()}');
      Uri url = Uri.http( Apiconfig.API_ECOMMERCE, '/address');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String body = json.encode(address.toJson());
      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if(response.statusCode == 200 || response.statusCode == 201){
      Address addressResponse = Address.fromJson(data);
      return Success(addressResponse);
      }
      else { // Error
      return Error(listToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

}