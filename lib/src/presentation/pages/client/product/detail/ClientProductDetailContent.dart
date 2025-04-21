import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultButton.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/widgets/DefaultIconBack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ClientProductDetailContent extends StatelessWidget {

  Product? product;

  ClientProductDetailContent(this.product);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageSlideshow(),
            _textName(),
            _textDescription(),
            _textPrice(),
            Spacer(),
            Divider(color: Colors.grey[300], height: 0, thickness: 2),
            _actionsShoppingBag()
          ],
        ),
        DefaultIconBack(left: 15, top: 10, color: Colors.black,)
      ],
    );
  }

  Widget _actionsShoppingBag(){
    return Container(
      color: Colors.grey[300],
      width: double.infinity,
      padding: EdgeInsets.only(top: 15, bottom: 20, left: 30, right: 30),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              )
            ),
            child: Text(
              '-',
              style: TextStyle(
                fontSize: 25
              ),
            ),
          ),
          Container(
            width: 45,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[400],
            ),
            child: Text(
              '0',
              style: TextStyle(
                fontSize: 25
              ),
            ),
          ),
          Container(
            width: 45,
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )
            ),
            child: Text(
              '+',
              style: TextStyle(
                fontSize: 25
              ),
            ),
          ),
          Spacer(),
          Container(
            width: 200,
            child: DefaultButton(
              text: 'AGREGAR', 
              onPressed: () {}
            ),
          )
        ],
      ),
    );
  }

  Widget _textName() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 30),
      child: Text(
        product?.name ?? '',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      ),
    );
  }

  Widget _textDescription() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 15),
      child: Text(
        product?.description ?? '',
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey
        )
      ),
    );
  }

  Widget _textPrice() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 15),
      child: Text(
        'Precio: ${product?.price ?? ''}',
        style: TextStyle(
          fontSize: 17,
          color: Colors.green,
          fontWeight: FontWeight.bold
        )
      ),
    );
  }

  Widget _imageSlideshow(){
    return ImageSlideshow(

          width: double.infinity,
          height: 400,
          initialPage: 0,
          indicatorColor: Colors.blue,
          indicatorBackgroundColor: Colors.grey,
          children: [

            product!.image1!.isNotEmpty
             ? FadeInImage.assetNetwork(
                  placeholder: 'assets/img/user_image.png',
                  image: product!.image1!,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(seconds: 1),
                ) 
            : Container(),
            product!.image2!.isNotEmpty
             ? FadeInImage.assetNetwork(
                  placeholder: 'assets/img/user_image.png',
                  image: product!.image2!,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(seconds: 1),
                ) 
              : Container(),
          ],
          onPageChanged: (value) {
            print('Page changed: $value');
          },
          // autoPlayInterval: 3000,
          // isLoop: true,
        );
  }
}