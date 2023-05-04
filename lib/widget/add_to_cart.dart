import 'package:advance_notification/advance_notification.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/data/app_data.dart';
import 'package:ecommerce_app/model/base_model.dart';

class AddToCart {
  static void addToCart(BaseModel data, BuildContext context) {
    bool contains = itemsOnCart.contains(data);

    if (contains == true) {
      const AdvanceSnackBar(
        textSize: 14.0,
        bgColor: Colors.red,
        message: 'Você adicionou este item ao carrinho antes',
        mode: Mode.ADVANCE,
        duration: Duration(seconds: 5),
      ).show(context);
    } else {
      itemsOnCart.add(data);

      const AdvanceSnackBar(
        textSize: 14.0,
        message: 'Adicionado com sucesso ao seu carrinho',
        mode: Mode.ADVANCE,
        duration: Duration(seconds: 5),
      ).show(context);
    }
  }
}
