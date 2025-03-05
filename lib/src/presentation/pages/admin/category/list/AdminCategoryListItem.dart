import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:flutter/material.dart';

class AdminCategoryListItem extends StatelessWidget {
  Category? category;
  AdminCategoryListItem(this.category);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: category != null
          ? Container(
            width: 70,
            child: FadeInImage.assetNetwork(
                placeholder: 'assets/img/user_image.png',
                image: category!.image!,
                fit: BoxFit.cover,
                fadeInDuration: Duration(seconds: 1),
              ),
          )
          : Container(),
      title: Text(category?.name ?? ''),
      subtitle: Text(category?.description ?? ''),
      contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10),
      trailing: Wrap(
        direction: Axis.horizontal,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
