import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/bloc/ClientProductListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/bloc/ClientProductListEvent.dart';
import 'package:flutter/material.dart';

class ClientProductListItem extends StatelessWidget {
  
  ClientProductListBloc? bloc;
  Product? product;

  ClientProductListItem(this.bloc,this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, 'admin/product/list', arguments: category);
      },
      child: ListTile(
        trailing: product != null
            ? Container(
              width: 70,
              child: product!.image1!.isNotEmpty ? FadeInImage.assetNetwork(
                  placeholder: 'assets/img/user_image.png',
                  image: product!.image1!,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(seconds: 1),
                ) : Container(),
            )
            : Container(),
        title: Text(product?.name ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(product?.description ?? ''),
            SizedBox(height: 4),
            Text('\$${product?.price.toString() ?? ''}'),
          ],
        ),
        contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10), 
      ),
    );
  }
}
